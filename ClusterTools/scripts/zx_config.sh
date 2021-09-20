#!/usr/bin/env bash
#
# Copyright 2018 - 2020 Zettar Inc. All rights reserved.
#
# The following code is for internal use only.  Redistribution in any
# form to a third party is prohibited without prior written permission
# from Zettar Inc.
#
# Name   : zx_config.sh
#
# Authors: Igor Solovyov <igor@zettar.com>
#          Chin Fang <fangchin@zettar.com>
#
# Purpose: Help new users
#          o Learn to configure the zx configuration file, zx.conf quickly
#          o Gain familiarity with selected zx.conf options
#
# Notes :  0. It depends on the availability of the whiptail and/or dialog,
#             the crudini, the openssl, and the uuidgen utilities. All are
#             readily available from either official or well-established
#             package repos for the Linux distros that Zettar zx targets.
#          1. Although this script is simple and straighforward, please 
#             keep its goals in mind, and not attempt to extend it
#             much. See the next note.
#          2. Running this script for a cluster of nodes can become tedious
#             quickly.  Use it as a learning but not an ultimate tool.
#             When managing a cluster of DTNs, we strongly recommend to use
#             this tool to learn how to set zx.conf correctly, then use a
#             configuration management system (e.g. ansible, chef, puppet) to
#             come up a fully automated approach that scales.
#          3. The preferred dialog utility can be set using the
#             environmental variable DIALOG like so: export DIALOG='whiptail'.
#          4. Since the users of this wizard most likely are new to zx, so
#             they will be using a 1:1 setup for sure.  Thus, the default
#             announcers=self used in the zx.conf is kept.
#
# Usage : $ zx_config.sh -i zx.conf
#
# References:
#         0. https://en.wikibooks.org/wiki/Bash_Shell_Scripting/Whiptail
#         1. https://stackoverflow.com/questions/13000391/how-to-display-infobox-in-whiptail
#            Please note that the infobox option does not work.  Thus it's
#            recommended to use the msgbox, which is more appropriate for
#            our use case anyway. Nobody can read many data points
#            instantly.
#         2. https://unix.stackexchange.com/questions/64627/whiptail-or-dialog
#         3. https://github.com/pixelb/crudini - the most important usage
#            is the update of an existing var:
#            crudini --set --existing config_file section parameter value
#         4. https://docs.zettar.com/wiki/configuration_and_tuning_guide#Quickcheatsheets
#

#
# A few global variables. Contrary to a myth popular among newbie
# programmers, if judiciously employed, global variables simplify
# programming :D
#
crudini=/usr/bin/crudini

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
osl=$(which openssl 2>/dev/null)
uuidg=$(which uuidgen 2>/dev/null)
colors_opt=''
dlg_h=24
dlg_w=78
next="Continue"
back="Go back"
back_title="zx_config"
cpu_num=$(nproc)
step=0

#
# These variables are used in the listed zx.conf sections. Default values
# are given. Some are further explained with comments. For more detailed
# info, please see 1) the zx man page ($ man zx) and 2) the online Zettar
# online user documentation set
#

# [general]
#
# daemon=false should be used with Linux distros which use systemd. With
# older Linux distros, daemon=true
#
daemon=$(pidof systemd > /dev/null && echo false || echo true)
src_data_dir=''
dest_data_dir=''
# [net]
net_threads=$cpu_num
#
# By default, we let the OS thread scheduler to decide which CPU/cores
# to use.  Remember Professor Don Knuth's admonition: "premature
# optimization is the root of all evil."
#
net_affinity=''
# [rest]
rest_login=zx
rest_password=zx
# [fs]
fs_threads=$cpu_num
#
# See comments about net_affinity
#
fs_affinity=''
# [p2p]
p2p_threads=1
#
# See comments about net_affinity
#
p2p_affinity=''
p2p_iface=lo
#
# The peer_id is not exposed to users.  It is an advanced setting. We will 
# leave it blank, so that each peer_id is initialized to a random value
#
peer_id=''
# [s2s]
s2s_ifaces=lo
#
# Normally, the following default value should be reasonable. But for LOSF
# cases, it may need to be made longer, e.g. 90 sec
#
keep_alive_timeout_sec=15
# [announcer]
#
# The following are two parameters that demand more in-depth understanding
# or peer-to-peer communication. Thus, they are set as default.
#
announcer_address=239.255.8.8
announcer_port=7777
# [site]
site_name=customer
# [dtc]
#
# For files that are sized larger than 4MB/MiB, the following should be OK.
# But for LOSF, it's better to set it to, e.g. 1MiB
#
max_align_tail=0
# [dtc_db]
meta_dir=''
# [ddc]
#
# For files that are sized larger than 4MB/MiB, the following should be OK.
# But for LOSF, it's better to set it to, e.g. 900
task_progress_timeout=30
# [downloader]
#
# file_direct=true implies O_DIRECT is used for file IO. It means that ZX
# bypasses OS file cache.  Which setting is beneficial to data transfer
# performance has to be determined via testing, e.g. using fio.
#
downloader_file_direct=false
#
# Based on Zettar's performance tuning experience, they are important
# parameters to consider.  Thus, this wizard includes them.
#
downloading_piece_num=128
#
chunk_size=2MiB
# [uploader]
#
# Ditto
#
uploader_file_direct=false
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
This wizard helps a new Zettar zx user configure the software's
configuration file, zx.conf.

It has following command line parameters:
    -h                 - show this help
    -i                 - input (i.e. initial) zx.conf

An example: $ ./zx_config.sh -i /tmp/zx.conf

zx_config.sh always backs up a given zx configuration file.  In the example,
the initial /tmp/zx.conf is backed up as /tmp/zx.conf.bak.  After the session
is over, the diff utility can be used to see what the script has done. Using
the example above, you can do
cd /tmp
diff -c zx.conf zx.conf.bak |less
This way, you can learn how to set the options in zx.conf quickly and correctly.

The preferred dialog utility can be set using the environmental variable
DIALOG like so: export DIALOG='whiptail'.
EOF

    echo "$help_str"
    exit 0
}

check_app()
{
    local app=$1
    local rpm=$2
    local deb=$3
    local rhel
    [ -f /etc/redhat-release ] && rhel=true
    local msg
    
    if [ ! -x "$app" ]; then
        echo "$app is not installed."
        local do_this="sudo apt-get install $deb"
        [ "$rhel" ] && do_this="yum -y install $rpm"
        msg="Please do a $do_this and then re-run this wizard. "
        msg+="Aborting now."
        echo "$msg"
        exit 1
    fi
}

check_dependencies()
{
    check_app "$crudini"    crudini     crudini
    check_app "$uuidg"      util-linux  uuid-runtime
    check_app "$osl"        openssl     openssl

    if [ ! -x "$dlg" ]; then
        dlg=$(which $dlg_prg2 2>/dev/null)
        if [ ! -x "$dlg" ]; then
            echo "Neither $dlg_prg1 nor $dlg_prg2 are installed. Aborting!"
            exit 1
        fi
    fi
    [[ "$dlg" =~ dialog$ ]] && colors_opt="--colors"
}

#
# usage: in_array "what string" "${array[@]}"
#
in_array()
{
    local e match="$1"
    shift
    for e; do [[ "$e" == "$match" ]] && return 0; done
    return 1
}

canonicalize_path()
{
    local p=$1
    p=$(readlink -f "$(echo "$p" |tr -d '.')")
    echo "$p"
}

ynbox()
{
    local title=$1
    local text=$2
    local next_txt=$3
    local exit_txt=$4
    local final_step="(( step-1 ))" # if paramater is missed, just go to next
    [[ $# == 5 ]] && final_step=$5
    
    $dlg --backtitle "$back_title" --title "$title" \
         --yes-button "$next_txt" \
         --no-button "$exit_txt" \
         --yesno "$text" \
         $dlg_h $dlg_w
    local ec=$?
    
    case $ec in
        0)  (( ++step ))
            ;;
        1)  (( step=final_step ))
            ;;
    esac
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

    case $ec in
        0)  eval "$res_name"="$val"
            (( ++step ))
            ;;
        1)  (( --step ))
            ;;
    esac
}

mbox()
{
    local back_title=$1
    local title=$2
    local text=$3
    local scratch=/tmp/$(basename "$0").txt
    local lc=$(echo "$text"|wc -l)
    local final_step="(( step-1 ))" # if paramater is missed, just go to next
    [[ $# == 5 ]] && final_step=$5
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

password()
{
    local res_name=$1
    local title=$2
    local text=$3
    local def_val=$4

    if [[ "$dlg" =~ dialog ]]; then 
        #
        # The designer(s) of the dialog utility forgot a basic principle of
        # engineering: usability. Naming the option --insecure is
        # unfortunate!
        #
        val=$($dlg --backtitle "$back_title" --title "$title" --insecure \
                   --ok-button "$next" --cancel-button "$back" --passwordbox \
                   "$text" "$dlg_h" "$dlg_w" "$def_val" 3>&1 1>&2 2>&3)
    else
        val=$($dlg --backtitle "$back_title" --title "$title" \
                   --ok-button "$next" --cancel-button "$back" --passwordbox \
                   "$text" "$dlg_h" "$dlg_w" "$def_val" 3>&1 1>&2 2>&3) 
    fi
    local ec=$?

    case $ec in
        0)  eval "$res_name"="$val"
            (( ++step ))
            ;;
        1)  (( --step ))
            ;;
    esac
}

ifaces()
{
    local nics
    nics=$(ip -o -f inet a | cut -d ' ' -f 2)
    echo "$nics"
}

ips()
{
    local aa
    aa=$(ip -o -f inet a | cut -d ' ' -f 7)
    echo "$aa"
}

radiolist()
{
    local res_name=$1
    local title=$2
    local text=$3
    local on_item=$4
    local -a tags=($5)
    local -a items=($6)

    local n=0
    local params=""
    for i in "${tags[@]}"; do
        local status=OFF
        [ "$i" = "$on_item" ] && status="ON"
        local item="${items[$n]}"
        params="$params $i $item $status"
        (( n++ ))
    done

    val=$($dlg --backtitle "$back_title" --title "$title" \
               --ok-button "$next" --cancel-button "$back" --radiolist "$text" \
               "$dlg_h" "$dlg_w" "$n" $params 3>&1 1>&2 2>&3)
    local ec=$?

    case $ec in
        0)  eval "$res_name"="$val"
            (( ++step ))
            ;;
        1)  (( --step ))
            ;;
    esac
}

checklist()
{
    local res_name=$1
    local title=$2
    local text=$3
    local -a on_items=($4)
    local -a tags=($5)
    local -a items=($6)

    local n=0
    local params=""
    for i in "${tags[@]}"; do
        local status=OFF
        in_array "$i" "${on_items[@]}" && status="ON"

        local item="${items[$n]}"
        params="$params $i $item $status"
        (( n++ ))
    done

    res=$($dlg --backtitle "$back_title" --title "$title" \
          --ok-button "$next" --cancel-button "$back" --checklist "$text" \
          "$dlg_h" "$dlg_w" "$n" $params 3>&1 1>&2 2>&3)
    local ec=$?

    local val=''
    for i in $res; do
        local ii
        ii="${i//\"/}"
        if [ -n "$val" ]; then
            val="$val $ii"
        else
            val="$ii"
        fi
    done

    case $ec in
        0)  eval "$res_name=\"$val\""
            (( ++step ))
            ;;
        1)  (( --step ))
            ;;
    esac
}

sanity_check()
{
    local lb=$(( cpu_num/2 ))
    local ub=$(( cpu_num ))
    local re='[^a-zA-Z0-9_-]'
    local up='^[[:lower:]_][[:lower:][:digit:]_-]{2,15}$'
    #
    # Thanks Alex for providing the following
    #
    local ref="^\s*(([0-9]+\s*-\s*[0-9]+)|[0-9]+)(\s*,\s*(([0-9]+\s*-\s*[0-9]+)|[0-9]+))*\s*$"
    local res='[^a-zA-Z0-9\ \.]'
    
    # TODO: validate all collected variables, explain mistakes in the
    #       'ynbox' dialog
    
    # [general]
    # radiolist
    if [[ "$daemon" != "True" ]] && [[ "$daemon" != "true" ]] &&
           [[ "$daemon" != "1" ]] && [[ "$daemon" != "False" ]] &&
           [[ "$daemon" != "false" ]] && [[ "$daemon" != "0" ]]; then
        echo "daemon must be set to one of True, true, 1, False, false, 0!"
        exit 1
    fi
    # In a script like this, all we can do is to check whether the path is
    # a directory.  To check whether permissions are set correctly takes
    # a lot more code.
    if ! [[ -d "$src_data_dir" ]]; then
        echo "$src_data_dir does not exist!"
        exit 1
    fi
    if ! [[ -d "$dest_data_dir" ]]; then
        echo "$dest_data_dir does not exist!"
        exit 1
    fi
    # [net]
    if ! [[ "$net_threads" =~ ^[1-9]+[0-9]*$ ]] && 
            [[ "$net_threads" -ge "$lb" ]] &&
            [[ "$net_threads" -le "$ub" ]]; then
        echo "net_threads set incorrectly. Abort!"
        exit 1
    fi
    if ! [[ -z "$net_affinity" ]] || [[ "$net_affinity" =~ $ref ]]; then
        echo "net_affinity set incorrectly. Abort!"
        exit 1
    fi    
    # [rest]
    if  [[ "$rest_login" =~ $re ]]; then
        echo "rest_login is not a string. Abort!"
        exit 1
    fi
    if  [[ "$rest_password" =~ $re ]]; then
        echo "rest_login is not a string. Abort!"
        exit 1
    fi
    # [fs]
    if ! [[ "$fs_threads" =~ ^[1-9]+[0-9]*$ ]] && 
            [[ "$fs_threads" -ge "$lb" ]] &&
            [[ "$fs_threads" -le "$ub" ]]; then
        echo "fs_threads set incorrectly. Abort!"
        exit 1
    fi
    if ! [[ -z "$fs_affinity" ]] || [[ "$fs_affinity" =~ $ref ]]; then
        echo "fs_affinity set incorrectly. Abort!"
        exit 1
    fi    
    # [p2p]
    if ! [[ "$p2p_threads" =~ ^[1-9]+$ ]]; then
        echo "p2p_threads set incorrectly. Abort!"
        exit 1
    fi
    if ! [[ -z "$p2p_affinity" ]] || [[ "$p2p_affinity" =~ $ref ]]; then
        echo "p2p_affinity set incorrectly. Abort!"
        exit 1
    fi
    #
    # Each zx instance must have a unique peer_id, e.g. a non-negative integer,
    # a string (that fits the $re), or empty in such case it will be internally
    # initialized to a random value.  We simply the 3rd approach
    #
    peer_id=''
    if [[ ! -z "$peer_id" ]]; then
        echo "peer Id incorrectly set. Abort!"
        exit 1
    fi
    p2p_iface="$p2p_iface"
    if [[ "$p2p_iface" =~ $re ]]; then
        echo "p2p_iface incorrectly set. Abort!"
        exit 1
    fi
    # [s2s]
    s2s_ifaces="$s2s_ifaces"
    if [ -z "$s2s_ifaces" ]; then
        echo "s2s_ifaces unset.  Please do set a least one!"
        exit 1
    fi
    if [[ "$s2s_ifaces" =~ $res ]]; then
        echo "s2s_iface incorrectly set. Abort!"
        exit 1
    fi
    keep_alive_timeout_sec="$keep_alive_timeout_sec"
    if ! [[ "$keep_alive_timeout_sec" =~ ^[\-0-9]+$ ]] || \
            (( "$keep_alive_timeout_sec" <= 0 )); then
        echo "s2s_keep_alive_timeout_sec incorrectly set. Abort!"
        exit 1
    fi
    # [announcer]
    announcer_address=239.255.8.8
    if ! [[ "$announcer_address" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        echo "announcer_address incorrectly set. Abort!"
        exit 1
    fi
    announcer_port=7777
    if ! [[ "$announcer_port" =~ ^-?[0-9]+$ ]]; then
        echo "announcer_port incorrectly set. Abort!"
        exit 1
    fi  
    # [site]
    # Only reasonable and simple check for something like a site_name is
    # to prohibit it to be empty
    if [[ -z "$site_name" ]]; then
        echo "site_name empty. Abort!"
        exit 1
    fi
    # [dtc]
    max_align_tail="$max_align_tail"
    if [[ "$max_align_tail" -ne "0" ]] &&\
	   ! [[ "$max_align_tail" =~ ^[0-9]+MiB|MB|KiB|KB$ ]]; then
        echo "max_align_tail must be an integer, then MiB|MB|KiB|KB. Abort!"
        exit 1
    fi   
    # [dtc_db]
    if ! [[ -d "$meta_dir" ]]; then
        echo "$meta_dir does not exist!"
        exit 1
    fi
    # [ddc]
    task_progress_timeout="$task_progress_timeout"
    if ! [[ "$task_progress_timeout" =~ ^[\-0-9]+$ ]] || \
            (( "$task_progress_timeout" <= 0 )); then
        echo "task_progress_timeout incorrectly set. Abort!"
        exit 1
    fi
    # [downloader]
    # radiolist
    if [[ "$downloader_file_direct" != "True" ]] &&
            [[ "$downloader_file_direct" != "true" ]] &&
            [[ "$downloader_file_direct" != "1" ]] &&
            [[ "$downloader_file_direct" != "False" ]] &&
            [[ "$downloader_file_direct" != "false" ]] &&
            [[ "$downloader_file_direct" != "0" ]]; then
        echo "downloader_file_direct must be True, true, 1, False, false, or 0!"
        exit 1
    fi
    #
    # So far, these are not presented in the Zettar jinja2 template. But based
    # on our performance tuning experience, they are important parameters to
    # consider.  Thus, this wizard includes them.
    #
    if ! [[ "$downloading_piece_num" =~ ^[1-9]+$ ]]; then
        echo "downloading_piece_num must be an integer. Abort!"
        exit 1
    fi
    if ! [[ "$chunk_size" =~ ^[1-9]+MiB|KiB$ ]]; then
        echo "chunk_size must be an integer followed by MiB or KIB. Abort!"
        exit 1
    fi    
    # [uploader]
    # radiolist
    if [[ "$uploader_file_direct" != "True" ]] &&
           [[ "$uploader_file_direct" != "true" ]] &&
           [[ "$uploader_file_direct" != "1" ]] &&
           [[ "$uploader_file_direct" != "False" ]] &&
           [[ "$uploader_file_direct" != "false" ]] &&
           [[ "$uploader_file_direct" != "0" ]]; then
        echo "uploader_file_direct must be True, true, 1, False, false, or 0!"
        exit 1
    fi    
    # TODO: If there are mistakes, but user don't want to continue abort the
    #       script by assigning step=-1
    # Temporary unconditional normal further processing.
   (( ++step ))
   # TODO: in case if we know where the mistake was made assign wrong step,
   # e.g.: step=0
}

form_s2s_ifaces()
{
    local expression='('
    local nifaces=$(echo "$s2s_ifaces"|tr " " "\\n"|wc -l)
    if [[ "$nifaces" -gt 1 ]]; then # build up the expression
        IFS=' ' read -r -a ifaces <<< "$s2s_ifaces"
        for iface in "${ifaces[@]}"
        do
            expression="$expression""$iface"
            if [[ "$nifaces" -gt 1 ]]; then
                expression="$expression""|"
            fi
            (( --nifaces ))
        done
        expression="$expression"")"
    else
        expression="$s2s_ifaces"
    fi
    echo "$expression"
}

prepare_input()
{
    local zx_conf=$1
    if [ -f "$zx_conf" ] && [ ! -z "$zx_conf" ]; then
        echo "$zx_conf is being prepared..."
	sed -i -e 's/#daemon/daemon/' -e 's/#src_data_dir/src_data_dir/' \
	    -e 's/#affinity/affinity/g' -e 's/#threads/threads/g' \
	    -e 's/#iface/iface/g' -e 's/#peer_id/peer_id/' \
	    -e 's/#keep_alive_timeout_sec/keep_alive_timeout_sec/g' \
	    -e 's/#address/address/' -e 's/#port/port/' \
	    -e 's/#max_align_tail/max_align_tail/' \
	    -e 's/#task_progress_timeout/task_progress_timeout/' \
	    -e 's/#file_direct/file_direct/g' \
	    -e 's/#downloading_piece_num/downloading_piece_num/' \
	    -e 's/#chunk_size/chunk_size/' \
	    -e 's#@TRUSTED_CERTS_PATH@#/etc/ssl/certs#' "$zx_conf"
	echo "$zx_conf preparation done."
    fi
}	

modify_config()
{
    local zx_conf=$1
    if [ -f "$zx_conf" ] && [ ! -z "$zx_conf" ]; then
        echo "$zx_conf is being modified..."
        # the most important crudini usage is the update of an existing var:
        # crudini --set --existing config_file section parameter value
        # [general]
        $crudini --set --existing "$zx_conf" general daemon \
                 "$daemon"      
        $crudini --set --existing "$zx_conf" general src_data_dir \
                 "$src_data_dir"
        $crudini --set --existing "$zx_conf" general dest_data_dir \
                 "$dest_data_dir"
        # [net]
        $crudini --set --existing "$zx_conf" net threads "$net_threads"
        $crudini --set --existing "$zx_conf" net affinity "$net_affinity"       
        # [rest]
        $crudini --set --existing "$zx_conf" rest login "$rest_login"
        #
        # rest_password is stored in encrypted form
        #
        rest_password=$("$osl" passwd -1 -salt $("$uuidg") "$rest_password")
        $crudini --set --existing "$zx_conf" rest password "$rest_password"
        # [fs]
        $crudini --set --existing "$zx_conf" fs threads "$fs_threads"
        $crudini --set --existing "$zx_conf" fs affinity "$fs_affinity" 
        # [p2p]
        $crudini --set --existing "$zx_conf" p2p threads "$p2p_threads"
        $crudini --set --existing "$zx_conf" p2p affinity "$p2p_affinity"       
        $crudini --set --existing "$zx_conf" p2p iface "$p2p_iface"
        $crudini --set --existing "$zx_conf" p2p peer_id "$peer_id"
        # [s2s]
        $crudini --set --existing "$zx_conf" s2s ifaces "$s2s_ifaces"
        $crudini --set --existing "$zx_conf" s2s keep_alive_timeout_sec \
                 "$keep_alive_timeout_sec"
        # [announcer]
        $crudini --set --existing "$zx_conf" announcer address \
                 "$announcer_address"
        $crudini --set --existing "$zx_conf" announcer port \
                 "$announcer_port"

        # [site]
        $crudini --set --existing "$zx_conf" site name "$site_name"
        # [dtc]
        $crudini --set --existing "$zx_conf" dtc max_align_tail \
		 "$max_align_tail" 	
        # [dtc_db]
        $crudini --set --existing "$zx_conf" dtc_db path "$meta_dir""/dtc"
        # [ddc]
        $crudini --set --existing "$zx_conf" ddc task_progress_timeout \
                 "$task_progress_timeout"
        # [downloader]
        $crudini --set --existing "$zx_conf" downloader file_direct \
                 "$downloader_file_direct"
        $crudini --set --existing "$zx_conf" downloader downloading_piece_num \
                 "$downloading_piece_num"
        $crudini --set --existing "$zx_conf" downloader chunk_size \
                 "$chunk_size"  
        # [uploader]
        $crudini --set --existing "$zx_conf" uploader file_direct \
                 "$uploader_file_direct"        
        echo "$zx_conf modification done."
    fi
}

test_final_step()
{ 
    if [[ "$final_step" =~ ^[-+][0-9]$ ]] &&
           [ "$final_step" -eq "-1" ]; then
        step="$final_step"
    fi
}

intro_msg()
{
    local msg

    msg="This wizard sets selected options in a freshly installed Zettar zx "
    msg+="configuration file (INI format; default path: /etc/zettar/zx/zx.conf "
    msg+="after a zx-core package has been installed). The file has sections "
    msg+="such as [general], [net], [rest], [fs] etc. Options are set in their "
    msg+="order in the file. This wizard doesn't need the 'root' to run. "
    msg+="Use it to\\n\\n"
    msg+="o Learn to configure the zx configuration file\\n"
    msg+="o Gain familiarity with selected zx.conf options\\n\\n"
    msg+="To learn its basic usage, assuming the zx_config.sh is accessible "
    msg+="with your existing PATH, please try this wizard first like so: "
    msg+="$ zx_config.sh -h, where is the shell prompt.  Next, $ zx_config.sh "
    msg+="to become familiar with it, then with a zx configuration file or a "
    msg+="template like so: "
    msg+="$ zx_config.sh -i /tmp/zx.conf.  For testing, after the zx-core "
    msg+="package has been installed, $ cp /etc/zettar/zx/zx.conf /tmp to get "
    msg+="a copy of zx.conf for testing. Observe how the wizard "
    msg+="sets the options in the test file.\\n\\n"
    msg+="Use the [ Enter ] or [ Tab ] keys to proceed from "
    msg+="a dialog box to the next. Use Arrow keys to set options in a "
    msg+="radio or check list. Also man dialog or whiptail for other tips."
    
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
    
    hint="Enter the $path_type data directory's absolute path "
    hint+="(e.g. $example_path). The directory and its subdirectories must be "
    hint+="$mandatory_condition by the Zettar zx user (e.g. zettar_zx).  If "
    hint+="you prefer to use a new directory, please create it now on the "
    hint+="command line using another terminal.  Note, if a cluster is used, "
    hint+="all nodes must share the same $path_type directory.\\n\\n"
    hint+="If a network storage service is used, the entered choice can be "
    hint+="the mount point of a share (NFS) or volume (parallel file system), "
    hint+="assuming that is where $assumption. "
    hint+="The use of ACLs may be necessary in a multi-user "
    hint+="environment and the storage service must offer ACL support."    
    hint+="\\n\\n"
    if [ "$path_type" == "source" ] || [ "$path_type" == "destination" ]; then
        hint+="Multiple storage shares/volumes can be mounted under the "
        hint+="$path_type directory - zx can aggregate their IOPS."        
    elif [ "$path_type" == "meta" ]; then
        hint+="Note, if a cluster is used, all nodes must share the same "
        hint+="meta_dir, so that all the peers are aware of each other's state."
    fi

    echo "$hint"
}

thread_pool_size_entry_hint()
{
    local hint

    hint="Depending of the number of CPU/cores ($cpu_num), in general good "
    hint+="values are usually in [$(( cpu_num/2 )) .. $(( cpu_num ))]. "
    hint+="For P2P, use 1 if single node, 3 if multiple nodes. "
    hint+="The optimal value can be determined with automated parametric "
    hint+="studies, i.e. basic machine learning (ML)."
    
    echo "$hint"
}

file_direct_entry_hint()
{
    local type
    type=$1
    local hint

    hint="If ${type}_file_direct=true, then O_DIRECT is used for file IO. "
    hint+="It means that zx bypasses the OS file cache (aka page cache). "
    hint+="Which setting is beneficial to data transfer performance has to be "
    hint+="determined via testing, e.g. using fio."
    
    echo "$hint"
}

iface_entry_hints()
{
    local type
    type=$1
    local hint

    if [ "$type" == 'p2p_iface' ]; then
        hint="This interface is used for peer-to-peer comunications to unite "
        hint+="separate hosts in LAN into a cluster. Although P2P traffic "
        hint+="volume is low in general, using a dedicated interface for P2P "
        hint+="improves operational reliability.  A 1Gbps port is sufficient."
    elif [ "$type" = 's2s_ifaces' ]; then
        hint="This group of interface(s) is used for site-to-site "
        hint+="comunications for data transfer. Note that if you select "
        hint+="multiple, non-bonded interfaces, then the Linux OS and the "
        hint+="switch the node is connected to must be properly configured "
        hint+="first.\\n\\n"
        hint+="It is also strongly recommended to use ports from the same "
        hint+="network adaptor, i.e. the same vendor, model, and speed, e.g. "
        hint+="All 25Gbps ports from a Mellanox Ethernet card."
    fi
    hint+="\\n\\nNote, 'lo' is useful mostly for testing."
    
    echo "$hint"
}

downloader_param_entry_hints()
{
    local type
    type=$1
    local hint

    if [ "$type" != 'chunk_size' ]; then
        hint="This is a parameter important to transfer throughput. The "
        hint+="default is for sites with high-bandwidth (e.g. 100Gbps) and a "
        hint+="storage setup with high throughputs, (e.g. 200Gbps, possibly "
        hint+="aggregated). For resource constained sites (i.e. having only "
        hint+="low bandwidth (<= 1Gbps) and/or slow storage (throughput "
        hint+="<= 10Gbps), a good starting value "
        if [ "$type" == 'downloading_piece_num' ]; then
            hint+="would be 16."
        fi
    else
        hint="This is a parameter important to transfer throughput. "
        hint+="The default is for sites with medium to large "
        hint+="files.  For sites that have lots of small files "
        hint+="(aka LOSF) e.g. 30KB - 60KB, a good starting value "
        hint+="would be 512KiB."           
    fi

    echo "$hint"
}

final_review()
{
    local msg
    
    msg="Reivew the selected values:"$'\n'$'\n'
    msg+="zx configuration file: $input_file"$'\n'
    msg+="[general] daemon: $daemon"$'\n'
    msg+="[general] Source data path: $src_data_dir"$'\n'
    msg+="[general] Destination data path: $dest_data_dir"$'\n'
    msg+="[net] S2S threads: $net_threads"$'\n'
    msg+="[net] thread affinity: $net_affinity"$'\n'           
    msg+="[rest] Web UI username: $rest_login"$'\n'
    msg+="[rest] Web UI password: $rest_password"$'\n'
    msg+="[fs] FS threads: $fs_threads"$'\n'
    msg+="[fs] thread affinity: $fs_affinity"$'\n'             
    msg+="[p2p] P2P threads: $p2p_threads"$'\n'
    msg+="[p2p] thread affinity: $p2p_affinity"$'\n'           
    msg+="[p2p] P2P Peer Id: $peer_id"$'\n'
    msg+="[p2p] P2P interface: $p2p_iface"$'\n'
    interface_str="interface"
    nifaces=$(echo "$s2s_ifaces"|tr " " "\\n"|wc -l)
    [ "$nifaces" -gt 1 ] && interface_str="interfaces"
    msg+="[s2s] S2S $interface_str: $s2s_ifaces"$'\n'
    msg+="[s2s] S2S keep_alive_timeout_sec: $keep_alive_timeout_sec"$'\n'    
    msg+="[announcer] address: $announcer_address"$'\n'
    msg+="[announcer] port: $announcer_port"$'\n'
    msg+="[site] name: $site_name"$'\n'
    msg+="[dtc] max_align_tail: $max_align_tail"$'\n'     
    msg+="[dtc_db] metadata top dir: $meta_dir"$'\n'
    msg+="[ddc] task_progress_timeout: $task_progress_timeout"$'\n'     
    msg+="[downloader] file_direct: "
    msg+="$downloader_file_direct"$'\n'
    msg+="[downloader] downloading_piece_num: "
    msg+="$downloading_piece_num"$'\n'
    msg+="[downloader] chunk_size: $chunk_size"$'\n'
    msg+="[uploader] file_direct: $uploader_file_direct"$'\n'

    echo "$msg"
}

# main()
{
    input_file=''
    #
    # The following input file check is intentionally made non-mandatory.
    # The reason to do so is to allow a new user of this utility the freedom
    # to practice with it without preparing a zx configuration file first.
    #
    while getopts ":hi:" opt; do
    case $opt in
        h)
            help
        ;;
        i)  input_file=$OPTARG
            if [ -f "$input_file" ] && [ -s "$input_file" ]; then
                cp "$input_file" "$input_file"".bak"
            fi
            ;;
        *)  echo "Error: invalid option given!"
            exit 2
        ;;
    esac
    done
    check_dependencies

    CONT="yes"
    while [ "$CONT" = "yes" ]; do
        case $step in
            -1) echo "No configuration was generated"
                exit 1
                ;;
            0)  box_title="Introduction"
                current_step="$step"
                msg=$(intro_msg)
                ynbox "$box_title" "$msg" "$next" "Abort" "-1"
                ;;
            1)  to_be_set=src_data_dir
                current_step="$step"            
                box_title="[general] Enter the source data directory full path "
                hint=$(path_entry_hint source /var/local/zettar/zx/src readable \
                                       'data is read from')
                input "$to_be_set" "$box_title" "$hint" \
                      "$src_data_dir"
                src_data_dir=$(canonicalize_path "$src_data_dir")
                test_final_step
                if [[ "$step" =~ ^[0-9]$ ]] &&
                       [ "$step" -gt "0" ] &&
                       [ ! -d "$src_data_dir" ]; then
                    title="Missing source data directory!"
                    msg="You did not enter a src_data_dir! "
                    msg+="Please create the directory now!"
                    (( step-=2 ))
                    ebox "$back_title" "$title" "$msg"
                fi
                ;;
            2)  to_be_set=dest_data_dir
                current_step="$step"            
                box_title="[general] Enter the destination data directory "
                box_title+="full path:"
                hint=$(path_entry_hint destination /var/local/zettar/zx/dst \
                                       writeable 'data is written to')
                input "$to_be_set" "$box_title" "$hint" \
                      "$dest_data_dir"
                dest_data_dir=$(canonicalize_path "$dest_data_dir")
                test_final_step
                if  [[ "$step" =~ ^[0-9]$ ]] &&
                        [ "$step" -gt "0" ] &&
                        [ -d "$dest_data_dir" ] &&
                        [ "$dest_data_dir" == "$src_data_dir" ]; then
                    title="dest_data_dir cannot be = src_data_dir!"
                    msg="The dest_data_dir must be different from "
                    msg+="the src_data_dir. Now they are the same! "
                    msg+="Please create the destination data "
                    msg+="directory that differs from $src_data_dir."
                    (( step-=2 ))
                    ebox "$back_title" "$title" "$msg"
                fi
                if [[ "$step" =~ ^[0-9]$ ]] &&
                       [ "$step" -gt "0" ] &&
                       [ ! -d "$dest_data_dir" ] &&
                       [ "$step" -ge "$current_step" ]; then
                    title="Missing destination data directory!"
                    msg="Please create the destination data directory now!"
                    (( step-=2 ))
                    ebox "$back_title" "$title" "$msg"
                fi                  
                ;;                  
            3)  to_be_set=net_threads
                current_step="$step"            
                box_title="[net] Enter the number of threads in the "
                box_title+="S2S network pool:"
                hint=$(thread_pool_size_entry_hint)
                input "$to_be_set" "$box_title" "$hint" \
                      "$net_threads"
                test_final_step         
                ;;
            4)  to_be_set=rest_login
                current_step="$step"            
                box_title="[rest] Enter the username for Web UI/REST API login:"
                hint="This value is used for zx administrator Web UI access "
                hint+="and for zx control via REST API."
                input "$to_be_set" "$box_title" "$hint" "$rest_login"
                test_final_step 
                ;;
            5)  to_be_set=rest_password
                current_step="$step"            
                box_title="[rest] Enter the password for Web UI/REST API login:"
                hint="This password (default zx) is stored encrypted "
                hint+="and used for zx administrator web UI access and "
                hint+="for zx control via REST API. "
                password "$to_be_set" "$box_title" "$hint" "$rest_password"
                test_final_step 
                ;;
            6)  to_be_set=fs_threads
                current_step="$step"            
                box_title="[fs] Enter the number of threads for "
                box_title+="storage accesses:"
                hint=$(thread_pool_size_entry_hint)
                input "$to_be_set" "$box_title" "$hint" "$fs_threads"
                test_final_step 
                ;;
            7)  to_be_set=p2p_threads
                current_step="$step"            
                box_title="[p2p] Enter the number of threads in the "
                box_title+="P2P network pool:"
                hint=$(thread_pool_size_entry_hint)
                input "$to_be_set" "$box_title" "$hint" "$p2p_threads"
                test_final_step
                ;;
            8)  to_be_set=p2p_iface
                current_step="$step"            
                box_title="[p2p] Plese select the network interface for P2P:"
                hint=$(iface_entry_hints p2p_iface)
                radiolist "$to_be_set"  "$box_title" "$hint" "$p2p_iface" \
                          "$(ifaces)" "$(ips)"
                test_final_step
                ;;          
            9)  to_be_set=s2s_ifaces
                current_step="$step"            
                box_title="[s2s] Plese select the network interfaces for S2S:"
                hint=$(iface_entry_hints s2s_ifaces)
                checklist "$to_be_set" "$box_title" "$hint" \
                          "$s2s_ifaces" "$(ifaces)" "$(ips)"
                test_final_step
                ;;
            10) to_be_set=keep_alive_timeout_sec
                current_step="$step"            
                box_title="[s2s] Set the keep alive time out (in sec) for S2S:"
                hint="In general, the default value is OK. Nevertheless, "
                hint+="with Lots of Small Files (aka LOSF), a value of "
                hint+="90 (sec) is a reasonable initial value. "
                input "$to_be_set" "$box_title" "$hint" \
		      "$keep_alive_timeout_sec"
                test_final_step
                ;;  	    
            11) to_be_set=site_name
                current_step="$step"            
                box_title="[site] Enter the site name "
                hint="An unique description appropriate for your site.  "
                hint+="All nodes in a cluster must use the same name. "
		hint+="If a desired site name consists of multiple words "
		hint+="quote such words, e.g. 'Swarm A'. "
                input "$to_be_set" "$box_title" "$hint" "$site_name"
                test_final_step
                ;;
            12) to_be_set=max_align_tail
                current_step="$step"            
                box_title="[dtc] Enter the desired max_align_tail value:"
                hint="In general, the default value is OK. Nevertheless, "
                hint+="with Lots of Small Files (aka LOSF), the value "
                hint+="1MiB is recommended as the initial value. "
                input "$to_be_set" "$box_title" "$hint" "$max_align_tail"
                test_final_step
                ;; 	    
            13) to_be_set=meta_dir
                current_step="$step"
                box_title="[dtc_db] Enter the top dir path for zx metadata DB"
                hint=$(path_entry_hint meta /var/local/zettar/zx/mdbs \
                                       'readable and writeable' \
                                       'metadata DB is stored')  
                input "$to_be_set" "$box_title" "$hint" "$meta_dir"
                meta_dir=$(canonicalize_path "$meta_dir") 
                test_final_step
                if [ "$step" -ge "0" ] &&
                       [ "$step" -lt "$current_step" ]; then # [ Back ]
                    (( --step )) # to skip the connection string step
                    continue     # not break!
                fi
                if  [[ "$step" =~ ^[0-9]+$ ]] &&
                        [ "$step" -gt "0" ] &&
                        [ -d "$meta_dir" ]; then
                    if [ "$meta_dir" == "$src_data_dir" ]; then
                        title="meta_dir must != src_data_dir!"
                        msg="meta_dir must be be unique! The entered "
                        msg+="meta_dir is the same as src_data_dir: "
                        msg+="$src_data_dir "
                        msg+="Please recreate the metadata directory!"
                        (( step-=2 ))
                        ebox "$back_title" "$title" "$msg"
                    elif [ "$meta_dir" == "$dest_data_dir" ]; then
                        title="meta_dir must != dest_data_dir!"
                        msg="meta_dir must be be unique! The entered "
                        msg+="meta_dir is the same as dest_data_dir: "
                        msg+="$dest_data_dir "
                        msg+="Please recreate the metadata directory!"
                        (( step-=2 ))
                        ebox "$back_title" "$title" "$msg"
                    fi
                fi
                if [ ! -d "$meta_dir" ]; then
                    title="Missing meta data directory!"
                    msg="You did not enter a meta_dir! "
                    msg+="Please create the directory now!"
                    (( step-=2 ))
                    ebox "$back_title" "$title" "$msg"
                fi                
                ;;
            14) to_be_set=task_progress_timeout
                current_step="$step"            
                box_title="[ddc] Set the desired task progress timeout value: "
                hint="In general, the default value is OK. Nevertheless, "
                hint+="with Lots of Small Files (aka LOSF), the value of "
                hint+="600 (sec) should be a reasonable initial value. "
                input "$to_be_set" "$box_title" "$hint" "$task_progress_timeout"
                test_final_step
                ;;  	    
            15) to_be_set=downloader_file_direct
                current_step="$step"
                box_title="[downloader] Use O_DIRECT or not:"
                hint=$(file_direct_entry_hint downloader)
                radiolist "$to_be_set"  "$box_title" "$hint" \
                          "$downloader_file_direct" \
                          "false true" ":Disable :Enable"
                test_final_step
                ;;
            16) to_be_set=downloading_piece_num
                current_step="$step"
                box_title="[downloader] Enter a desired downloading_piece_num"
                hint=$(downloader_param_entry_hints downloading_piece_num)
                input "$to_be_set" "$box_title" "$hint" "$downloading_piece_num"
                test_final_step
                ;;
            17) to_be_set=chunk_size
                current_step="$step"
                box_title="[downloader] Enter a desired chunk_size"
                hint=$(downloader_param_entry_hints chunk_size)                
                input "$to_be_set" "$box_title" "$hint" "$chunk_size"
                test_final_step
                ;;
            18) to_be_set=uploader_file_direct
                current_step="$step"
                box_title="[uploader] Use O_DIRECT or not:"
                hint=$(file_direct_entry_hint uploader)                
                radiolist "$to_be_set"  "$box_title" "$hint" \
                          "$downloader_file_direct" \
                          "false true" ":Disble :Enable"
                test_final_step
                ;;          
            19) box_title="Selected values"
                current_step="$step"
                msg=$(final_review)
                mbox "$back_title" "$box_title" "$msg"
                test_final_step
                ;;
            20) sanity_check
                ;;
            21) current_step="$step"
                if [ ! -f "$input_file" ]; then
                    back_title="Final step"
                    title="The last step"
                    msg="No input file provided. A practice run?"
                    mbox "$back_title" "$title" "$msg"
                    test_final_step
                    # Normal loop leaving.
                    CONT="no"
                else
                    box_title="Configuration is done"
                    msg="Finally, the resulting zx.conf will be modified."
                    ynbox "$box_title" "$msg" "Modify zx.conf" "$back"
                    test_final_step
                    if [ "$step" -lt "$current_step" ]; then
                        (( --step )) # skip the sanity check
                    else
                        CONT="no"
                    fi
                fi
                ;;
            *)  echo "Error: wrong step."
                exit 2
                ;;
        esac
    done

    # zx, a C++ code, anticipates a regexp, which is formed below
    s2s_ifaces=$(form_s2s_ifaces)
    prepare_input "$input_file"
    modify_config "$input_file"
    clear
    
    exit $?
} # end of main

#############################################################################
#TODOs:
#
# Additional notes from the discussion between Igor and Chin on 02/07/2018
# over HangOuts:
#
# Also, based on Igor's 12/08/2017 email to Chin, Subject Re: Next Zettar
# meeting, we probably should provide suggested values for the following:
#
# o s2s.keep_alive_timeout_sec=90
# o ddc.task_progress_timeout=300
#
# Also the Q like "do you need config ZX to work behind NAT?" and optional
# Wizard step discovering of external IP address is nice to have...
#
# The appropriate number of threads for the various thread pools should
# be coded in this script. But a general guideline is difficult, as they
# depend on the cluster size, which could vary from site to site.
#
