#!/usr/bin/env bash
#
# Copyright 2018 - 2020 Zettar Inc. All rights reserved.
#
# The following code is for internal use only.  Redistribution in any
# form to a third party is prohibited without prior written permission
# from Zettar Inc.
#
# Name   : dtn_info.sh
#
# Authors: Chin Fang <fangchin@zettar.com>
#
# Purpose: Collect the following info from a data transfer node (aka DTN):
#          o /etc/redhat-release or /etc/os-release together with uname -a
#          o hostname
#          o ip a
#          o CPU number, the number of cores per CPU, and CPU model name
#          o memory capacity
#          o df -h output (for capacity info)
#          o df -i -h output (for inode info)
#          o lsblk output
#          o fio availability
#          o permission & owner of the source data directory
#          o Permission & owner of the destination data directory
#          o Permission & owner of the metadata directory
#
# Notes  : 0. None of the above demands 'root' priviledge to find
#          1. The info collected is essential to
#             o The initial zx configuration
#             o Subsequent zx tuning
#             o Remote trouble-shooting
#          2. The script displays the collected info and saves it into a file
#             that a user can send to support@zettar.com for technical support
#          3. The textbox option of both whiptail and dialog is employed
#             to display the output of ip a, instead of msgbox. The reason
#             is because the textbox option by default allows scrolling
#             up and down with the PgUp and PgDn keys
#          4. The preferred dialog utility can be set using the
#             environmental variable DIALOG like so: export DIALOG='whiptail'.
#
# Usage : $ dtn_info.sh 
#
# References:
#         0. https://trac.zettar.com/docs/wiki/WikiStart#Initialconfiguration
#         1. http://www.gnu.org/software/bash/manual/bashref.html#Here-Documents
#

#
# A few global variables. Contrary to a popular myth among newbie
# programmers, if judiciously employed, global variables simplify
# programming :D
#

#
# The two utilities dialog and whiptail function more or less the same.
# Nevertheless, the key-combo Cntl-C can terminate a dialog session, but 
# not so with whiptail - it blocks.  As of now, whiptail seems to be
# installed by default by many Linux distros.
#
# In the following, dialog is selected first for the simple reason that
# while maintaining the script, being able to use Cntl-C to terminate a
# session is convenient. dialog is also more feature-rich than whiptail.
# man dialog and man whiptail should make this aspect evident.
#
dlg_prg1=dialog
dlg_prg2=whiptail
dlg=$(which "${DIALOG:-$dlg_prg1}" 2>/dev/null)
colors_opt=''
dlg_h=24
dlg_w=78
next="Continue"
back="Stop"
step=0
os_info=''
hn=$(hostname)
ipa=$(ip a)
cpu_info=$(lscpu|grep -i socket; lscpu|grep ^'Model name')
ram_capacity=$(free -g |grep ^Mem)
dfh=$(df -h)
dfi=$(df -i -h)
ls_blk=$(lsblk)
fio_availability=$(echo -e "$(which fio 2>/dev/null)"|tr -d '[:space:]')
src_data_dir_info=''
dest_data_dir_info=''
meta_dir_info=''
#
# The source data directory and the destination data directory.  Note that
# a DTN can play the role of both a source and a destination.  As such, it
# is strongly recommended (in fact mandatory) to configure the two
# directories on a DTN that runs Zettar zx.
#
src_data_dir=''
dest_data_dir=''
meta_dir=''
final_info_file="/tmp/${hn}_dtn_info.txt"  # in case of a cluster of nodes

#
# Various functions
#
trap ctrl_c INT

function ctrl_c()
{
    final_step=-1
    return
}

help()
{
    local help_str=''
    read -r -d '' help_str <<EOF
This wizard helps a new Zettar zx user collect certian essential
information about a data transfer node (DTN) on which Zettar zx is to run

   o /etc/redhat-release or /etc/os-release together with uname -a
   o hostname
   o ip a
   o CPU number, the number of cores per CPU, and the CPU model name
   o memory capacity
   o df -h output
   o df -i -h output
   o lsblk
   o fio availability
   o permission & owner of the source data directory
   o Permission & owner of the destination data directory
   o Permission & owner of the metadata directory

Note that none of the above demands the 'root' priviledge to find.  

The preferred dialog utility can be set using the environmental variable
DIALOG like so: export DIALOG='whiptail'.

It has following command line parameters:
    -h                 - show this help

An example: $ ./dtn_info.sh 

dtn_info.sh always saves the info it has found in /tmp/${hn}_dtn_info.txt.
EOF
    echo "$help_str"
    exit 0
}

check_dependencies()
{
    if [ ! -x "$dlg" ]; then
        dlg=$(which $dlg_prg2 2>/dev/null)
        if [ ! -x "$dlg" ]; then
            echo "Neither $dlg_prg1 nor $dlg_prg2 are installed, aborting!"
            exit 1
        fi
    fi
    [[ "$dlg" =~ dialog$ ]] && colors_opt="--colors"
}

mbox()
{
    local back_title=$1
    local title=$2
    local text=$3
    local scratch
    scratch=/tmp/$(basename "$0").txt
    local lc
    lc=$(echo "$text"|wc -l)
    local final_step="(( step-1 ))" # if a paramater is missed, just go to next
    [[ $# == 4 ]] && final_step=$4
    local exit_lbl
    local OK
    #
    # Only dialog needs the following. whiptail always uses OK
    #
    [[ "$dlg" =~ dialog$ ]] && exit_lbl="--exit-label" && OK="OK"
    
    if [[ "$lc" -le "$dlg_h" ]]; then
        $dlg $colors_opt --backtitle "$back_title" --title "$title" \
             --msgbox "$text" $dlg_h $dlg_w
    else
        echo "$text" > "$scratch"
        #
        # See man dialog COMPATIBILITY section - dialog maps whiptail's
        # incompatible --scrolltext to --scrollbar.  Note that due to
        # whiptail's parsing deficiency, neither the $exit_lbl nor $OK
        # can be double-quoted :(
        #
        $dlg --backtitle "$back_title" --title "$title" --scrolltext \
             $exit_lbl $OK --textbox "$scratch" $dlg_h $dlg_w
    fi
    local ec=$?
    case $ec in
        0)  (( ++step ))
            ;;
        1)  (( step=final_step ))
            ;;
    esac
    if [[ -f "$scratch" ]]; then
        rm -f "$scratch"
    fi
}

# Error box
ebox()
{
    mbox "$1" "\\Zb\\Z1$2\\Zn" "$3" "$4"
}

input()
{
    local res_name=$1
    local title=$2
    local text=$3
    local def_val=$4

    val=$($dlg --backtitle "$back_title" --title "$title" \
               --ok-button "$next" --cancel-button "$back" --inputbox "$text" \
               "$dlg_h" "$dlg_w" "$def_val" 3>&1 1>&2 2>&3)
    local ec=$?
    
    # Cntl-C (INT) is received
    if [[ "$final_step" =~ ^[-+][0-9]+$ ]] && [ "$final_step" -eq "-1" ]; then
        (( step=final_step ))
    else
        case $ec in
            0)  eval "$res_name"="$val"
                (( ++step ))
                ;;
            1)  final_step=-1 # [Stop] is selected
                (( step=final_step ))
                ;;
        esac
    fi
}

canonicalize_path()
{
    local p=$1
    p=$(readlink -f "$(echo "$p" |tr -d '.')")
    echo "$p"
}

save_info()
{
    echo $'\t'"=====================" > "$final_info_file"
    {
        echo $'\t'"Operating system info"
        echo $'\t'"====================="
        echo "$os_info"
    
        echo $'\t'"======================================" 
        echo $'\t'"Data transfer node (aka DTN) host name"
        echo $'\t'"======================================"
        echo $'\n'"$hn"
        echo $'\n'
    
        echo $'\t'"================" 
        echo $'\t'"Full ip a output" 
        echo $'\t'"================" 
        ip a 
    
        echo $'\t'"=============================" 
        echo $'\t'"CPU, core, and CPU model name" 
        echo $'\t'"=============================" 
        echo $'\n'"$cpu_info" 
    
        echo $'\t'"=======================================" 
        echo $'\t'"System memory info as output by free -g"
        echo $'\t'"=======================================" 
        echo $'\n'"$ram_capacity" 
    
        echo $'\t'"============================================="
        echo $'\t'"Available storage capacity as output by df -h" 
        echo $'\t'"============================================="
        echo $'\n'"$dfh"
    
        echo $'\t'"==========================================" 
        echo $'\t'"Available inode info as output by df -i -h"
        echo $'\t'"=========================================="
        echo $'\n'"$dfi"

        echo $'\t'"==========================================" 
        echo $'\t'"List of block devices"
        echo $'\t'"=========================================="
        echo $'\n'"$ls_blk"
        
        s="fio availability"
        echo $'\t'"===================================================="
        echo $'\t'"$s"
        echo $'\t'"===================================================="
        echo $'\n'"$fio_availability"

        local s="Permission & owner of the source data directory"
        echo $'\t'"==============================================="
        echo $'\t'"$s"
        echo $'\t'"==============================================="
        echo $'\n'"$src_data_dir_info"
    
        s="Permission & owner of the destination data directory"
        echo $'\t'"===================================================="
        echo $'\t'"$s"
        echo $'\t'"===================================================="
        echo $'\n'"$dest_data_dir_info"
    
        s="Permission & owner of the metadata directory"
        echo $'\t'"===================================================="
        echo $'\t'"$s"
        echo $'\t'"===================================================="
        echo $'\n'"$meta_dir_info"
        echo $'\t'"==End of report =="
        } >> "$final_info_file"        
}

intro_msg()
{
    local msg
    
    msg="This wizard helps a Zettar zx user collect "
    msg+="the following information from a data transfer node "
    msg+="(aka DTN) on which Zettar zx is to run:\\n\\n"
    msg+="o /etc/redhat-release or /etc/os-release together "
    msg+="with name -a\\n"
    msg+="o hostname\\n"
    msg+="o ip a\\n"
    msg+="o CPU number, the number of cores per CPU, and CPU "
    msg+="model name\\n"
    msg+="o memory capacity\\n"
    msg+="o df -h\\n"
    msg+="o df -i -h\\n"
    msg+="o lsblk\\n"
    msg+="o fio availability\\n"
    msg+="o permission/owner of the source data directory\\n"
    msg+="o permission/owner of the destination data\\n"
    msg+="o permission/owner of the metadata directory\\n\\n"
    msg+="The info collected is essential to "
    msg+="1) The initial zx configuration "
    msg+="2) Subsequent zx tuning and "
    msg+="3) Remote trouble-shooting\\n\\n"
    msg+="The info is both displayed and saved in "
    msg+="/tmp/${hn}_dtn_info.txt."

    echo "$msg"
}

#
# A function that prints out the appropriate hint for the to be entered
# absolute path
#
# $1: string; only 'source', 'destination', and 'meta' are acceptable
# $2: string; /var/local/zettar/zx/{src,dst,mdbs}
# $3: string; readable, writeable, both 'readable and writeable'
# $4: string; 'data is read from', 'data is written into',
#             'metadata DB is stored'
#
# Calling example: path_entry_hint source /var/local/zettar/zx/src readable \
#                                  'data is read from'
#
path_entry_hint()
{
    local path_type
    local example_path
    local mandatory_condition
    local assumption
    local hint
    path_type=$1
    example_path=$2
    mandatory_condition=$3
    assumption=$4
    
    hint="Enter the $path_type data directory's absolute "
    hint+="path (e.g. $example_path). The directory "
    hint+="and its subdirectories must be $mandatory_condition by the "
    hint+="Zettar zx user (e.g. zettar_zx).  If you prefer "
    hint+="to use a new directory, please create it now on "
    hint+="the command line using another terminal.  Note, if "
    hint+="a cluster is used, all nodes must share the same "
    hint+="$path_type directory.\\n\\n"
    hint+="If a network storage service is used, "
    hint+="the entered choice can be the mount point of a "
    hint+="share (NFS) or volume (parallel file system), "
    hint+="assuming that is where $assumption. "
    hint+="The use of ACLs may be necessary in a multi-user "
    hint+="environment and the storage service must offer ACL support."
    hint+="\\n\\n"
    if [ "$path_type" == "source" ] || [ "$path_type" == "destination" ]; then
        hint+="Multiple storage shares/volumes can be mounted "
        hint+="under the $path_type directory - zx can aggregate their "
        hint+="IOPS."        
    elif [ "$path_type" == "meta" ]; then
        hint+="Note, if a cluster is used, all nodes must share "
        hint+="the same meta_dir. This is how all the peers "
        hint+="stay aware of each other's state."
    fi

    echo "$hint"
}

# main()
{
    check_dependencies

    while getopts ":h" opt; do
    case $opt in
        h)
            help
        ;;
        *)  echo "Error: invalid option given!"
            exit 2
        ;;
    esac
    done

    CONT="yes"
    while [ "$CONT" = "yes" ]; do
        case $step in
            -1) echo "No info has been collected"
                exit 1
                ;;
            0)  back_title="Introduction"
                title="Purpose of this utility:"
                msg=$(intro_msg)
                mbox "$back_title" "$title" "$msg"
                ;;
            1)  back_title="OS info"
                title="The details of this DTN's operationg system:"
                #
                # The /etc/os-release of RHEL and its free rebuilds is
                # not that informative.  For Debian and its free derivatives,
                # /etc/os-release does provide more details.  The uname -a
                # output shows OS patch-level info, which could be helpful
                # in certain trouble-shooting situations
                #
                if [[ -f /etc/redhat-release ]]; then
                    os_info=$(cat /etc/redhat-release;uname -a)
                else
                    os_info=$(cat /etc/os-release;uname -a)
                fi
                msg="$os_info"
                mbox "$back_title" "$title" "$msg"
                ;;
            2)  back_title="DTN hostname"
                title="The hostname of this DTN:"
                msg="This DTN seems to have the hostname as\\n\\n$hn"
                mbox "$back_title" "$title" "$msg"
                ;;
            3)  back_title="Network interface info"
                title="The full ip a output:"           
                msg="$ipa"
                mbox "$back_title" "$title" "$msg"
                ;;
            4)  back_title="CPU info"
                title="The numbers of CPU sockets and cores, and model name:"
                msg="$cpu_info"
                mbox "$back_title" "$title" "$msg"
                ;;
            5)  back_title="RAM capacity"
                title="RAM info as displayed by free -g (GB):"          
                msg="Memory|total|used|free|shared|buff/cache|available\\n\\n"
                mem_info=$(echo "$ram_capacity"|tr -s ' ' '|')
                msg="$msg""$mem_info"
                mbox "$back_title" "$title" "$msg" 
                ;;
            6)  back_title="Free space" 
                title="Storage space (including imported) it has access to "
                title="$title""(df -h)?"
                msg="$dfh"
                mbox "$back_title" "$title" "$msg"
                ;;
            7)  back_title="Inode info" 
                title="Are there enough inodes (df -i -h)?"             
                msg="$dfi"
                mbox "$back_title" "$title" "$msg"
                ;;
            8)  back_title="List of block devices" 
                title="A list of all non-empty block devices"             
                msg="$ls_blk"
                mbox "$back_title" "$title" "$msg"
                ;;            
            9)  back_title="fio availability"
                title="Is fio installed on this server?"
                msg="fio is the official Linux block subsystem QA tool. "
                msg+="Please see: https://github.com/axboe/fio. Zettar "
                msg+="strongly recommends it for measuring the throughput "
                msg+="of a file system (local or distributed).\\n\\n"
                if [ -z "$fio_availability" ]; then
                    msg="$msg""fio is not installed on this server. " 
                    if [ -f /etc/redhat-release ]; then
                        msg="$msg""Please install it using yum install fio "
                    else
                        msg="$msg""Please install it using apt-get install fio."
                    fi
                    mbox "$back_title" "$title" "$msg"
                    fio_availability="Not yet installed"
                else
                    msg="fio is available at $fio_availability. "
                    msg+="Please run it to measure the throughput "
                    msg+="of the storage pool that the server reads data "
                    msg+="from or write data to."
                    mbox "$back_title" "$title" "$msg"
                fi
                ;;  
            10) back_title=src_data_dir
                box_title="Enter the source data directory's absolute path "
                hint=$(path_entry_hint source /var/local/zettar/zx/src readable \
                                'data is read from')
                input "$back_title" "$box_title" "$hint" \
                      "$src_data_dir"
                src_data_dir=$(canonicalize_path "$src_data_dir")
                if [ -d "$src_data_dir" ]; then
                    title="Permission/owner of the source data directory"
                    src_data_dir_info=$(stat "$src_data_dir")
                    msg="$src_data_dir_info"
                    mbox "$back_title" "$title" "$msg"
                    if [ "$step" -eq "-1" ]; then
                        break
                    else
                        (( --step ))
                    fi
                else
                    if [ "$step" -ne "-1" ]; then
                        title="Missing source data directory!"
                        if [ -z "$src_data_dir" ]; then
                            msg="You did not enter a src_data_dir! "
                        else
                            msg="The entered $src_data_dir does not exist! "
                        fi
                        msg="$msg""Please create the directory now!"
                        (( step-=2 ))
                        back_title=src_data_dir
                        ebox "$back_title" "$title" "$msg"
                    fi
                fi
                ;;
            11) back_title=dest_data_dir
                box_title="Enter the destination data directory's "
                box_title="$box_title""absolute path:"
                hint=$(path_entry_hint destination /var/local/zettar/zx/dst \
                                       writeable 'data is written to')
                input "$back_title" "$box_title" "$hint" \
                      "$dest_data_dir"
                if  [[ "$final_step" =~ ^[-+][0-9]+$ ]] &&
                        [ "$final_step" -eq "-1" ]; then
                    break
                fi
                dest_data_dir=$(canonicalize_path "$dest_data_dir")
                if [ -d "$dest_data_dir" ]; then
                    if [ "$dest_data_dir" == "$src_data_dir" ]; then
                        title="dest_data_dir cannot be = src_data_dir!"
                        msg="The dest_data_dir must be different from "
                        msg+="the src_data_dir. Now they are the same! "
                        msg+="Please create the destination data "
                        msg+="directory that differs from $src_data_dir."
                        (( step-=2 ))
                        ebox "$back_title" "$title" "$msg"
                    else        
                        title="Permission/owner of the destination data "
                        title="$title""directory"
                        dest_data_dir_info=$(stat "$dest_data_dir")
                        msg="$dest_data_dir_info"
                        mbox "$back_title" "$title" "$msg"
                        if [ "$step" -eq "-1" ]; then
                            break
                        else
                            (( --step ))
                        fi
                    fi
                else
                    title="Missing destination data directory!"
                    if [ -z "$dest_data_dir" ]; then
                        msg="You did not enter a dest_data_dir! "
                    else
                        msg="The entered $dest_data_dir does not exist! "
                    fi              
                    msg="$msg""Please create the directory now!"
                    if [[ "$final_step" =~ ^[-+][0-9]+$ ]] &&
                           [ "$final_step" -eq "-1" ]; then
                        break
                    else
                        (( step-=2 ))
                    fi
                    ebox "$back_title" "$title" "$msg"
                fi                  
                ;;
            12) back_title=meta_dir
                box_title="Enter the metadata directory's "
                box_title="$box_title""absolute path:"
                hint=$(path_entry_hint meta /var/local/zettar/zx/mdbs \
                                       'readable and writeable' \
                                       'metadata DB is stored')                
                input "$back_title" "$box_title" "$hint" \
                      "$meta_dir"
                if [[ "$final_step" =~ ^[-+][0-9]+$ ]] &&
                       [ "$final_step" -eq "-1" ]; then
                    break
                fi
                meta_dir=$(canonicalize_path "$meta_dir")               
                if [ -d "$meta_dir" ]; then
                    if [ "$meta_dir" == "$src_data_dir" ] ||
                       [ "$meta_dir" == "$dest_data_dir" ]; then
                        title="meta_dir must be unique! "
                        msg="The entered meta_dir cannot be the same as "
                        msg+="either the src_data_dir: $src_data_dir "
                        msg+="or the dest_data_dir: $dest_data_dir "
                        msg+="Please create a unique metadata directory!"
                        (( step-=2 ))
                        ebox "$back_title" "$title" "$msg"
                    else        
                        title="Permission/owner of the metadata directory"
                        meta_dir_info=$(stat "$meta_dir")
                        msg="$meta_dir_info"
                        mbox "$back_title" "$title" "$msg"
                        if  [ "$step" -eq "-1" ]; then
                            break
                        else
                            (( --step ))
                        fi
                    fi
                else
                    title="Missing metadata directory!"
                    if [ -z "$meta_dir" ]; then
                        msg="You did not enter a meta_dir! "
                    else
                        msg="The entered $meta_dir does not exist! "
                    fi                      
                    msg="$msg""Please create the directory now!"
                    (( step-=2 ))
                    ebox "$back_title" "$title" "$msg"
                fi                  
                ;;          
            13) back_title="Last step"
                title="Information collection done."            
                msg="Finally, all the collected info will be saved to "
                msg+="$final_info_file."
                mbox "$back_title" "$title" "$msg"
                # Normal loop leaving.
                CONT="no"
                ;;
            *)  echo "Error: wrong step."
                echo "step: $step"
                exit 2
                ;;
        esac
    done

    save_info 
    clear
    
    exit $?
} # end of main

