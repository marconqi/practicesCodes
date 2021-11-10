package main

// *********************************************************
// scanFolder and print the files which modified in oneYear.
// *********************************************************
// atime: the last time a file was read.
// mtime: the last time the contents of a file were modified.
// ctime: the time at which the metadata related to the file was changed.

import (
	"fmt"
	"os"
	"path/filepath"
	"syscall"
	"time"
)

// exists return whether the give file or directory exists
func exists(path string) (bool, error) {
	_, err := os.Stat(path)
	if err == nil {
		return true, nil
	}
	if os.IsNotExist(err) {
		return false, nil
	}
	return false, err
}

func main() {

	cmlargs := os.Args

	if len(cmlargs) != 2 {
		// fmt.Println(len(cmlargs))
		fmt.Println("scanFolder folderName")
		os.Exit(1)
	}
	folderName := cmlargs[1]
	// fmt.Println(exists(folderName))

	if sf, err := exists(folderName); err != nil && !sf {
		//root := folderName
		//fmt.Println(1)
		//} else {
		fmt.Println("The scan folder is not exist: ", folderName)
		fmt.Println(2)
		os.Exit(1)
	}

	var files []string
	//var rows [][]string

	//root := "/Users/qizhiguo/gocode"
	err := filepath.Walk(folderName, func(path string, info os.FileInfo, err error) error {
		files = append(files, path)
		return nil
	})

	if err != nil {
		panic(err)
	}

	baseTime := time.Now().Unix() - 3600*24*365
	// fmt.Println(baseTime)
	for _, file := range files {
		fi, err := os.Lstat(file)
		if err != nil {
			//log.Fatal(err)
			continue
		}
		if fi.IsDir() {
			continue
		}
		if fi.Mode()&os.ModeSymlink == os.ModeSymlink {
			//fmt.Println("File is a symbolic link")
			continue
		}
		fi_sys := fi.Sys()
		var stat = fi_sys.(*syscall.Stat_t)
		fi_atm := time.Unix(stat.Atimespec.Sec, stat.Atimespec.Nsec).Unix()
		// if compiled in Linux system. Atimespec is not defined
		//fi_atm := time.Unix(stat.Atim.Sec, stat.Atim.Nsec).Unix()
		if fi_atm < baseTime {
			fmt.Printf("%v,%v,%v,%v\n", fi.Name(), fi.Size(), fi.ModTime().Unix(), fi_atm)
		}

	}
}
