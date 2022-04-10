package main

import (
	"encoding/csv"
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strconv"
)

// ----------------------------------------------------------------
// anaSource.go
// the codes is: 1. go through the folder and get all the files' name, size and date
// 2. write the files' name, size and date into a csv file
// ----------------------------------------------------------------

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

// In the function getFileMd5code, the input is the filename and it's path, it will read
// the file and calculate the md5sum code of the file  and return back the md5sum code
func getFileMd5code(path string) (string, error) {
	return "true", nil
}

// write file error check function
func checkError(message string, err error) {
	if err != nil {
		log.Fatal(message, err)
	}
}

func main() {

	cmlargs := os.Args

	if len(cmlargs) != 2 {
		// fmt.Println(len(cmlargs))
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

	// fmt.Println(files)
	//baseTime := time.Now().Unix()
	// file is the file's relative path
	// open and write csv file.
	csvfile, err := os.Create("files2.csv")
	checkError("Cannot create files.csv", err)
	defer csvfile.Close()

	csvWriter := csv.NewWriter(csvfile)
	defer csvWriter.Flush()

	for _, file := range files {
		fi, err := os.Lstat(file)
		if err != nil {
			log.Fatal(err)
		}
		if fi.IsDir() {
			continue
		}
		if fi.Mode()&os.ModeSymlink == os.ModeSymlink {
			//fmt.Println("File is a symbolic link")
			continue
		}
		//fi_sys := fi.Sys()
		//var stat = fi_sys.(*syscall.Stat_t)
		//fi_gid := stat.Gid
		//fi_uid := stat.Uid
		// if in Linux, please change to time.Unix(stat.Ctim.Sec, stat.Ctim.Nsec) repeckly
		// .Unix() will change the time from human readable to int number.
		//fi_ctm := time.Unix(stat.Ctimespec.Sec, stat.Ctimespec.Nsec)
		//fi_ctm := time.Unix(stat.Ctimespec.Sec, stat.Ctimespec.Nsec).Unix()
		//fi_atm := time.Unix(stat.Atimespec.Sec, stat.Atimespec.Nsec).Unix()
		//fi_mtm := time.Unix(stat.Mtimespec.Sec, stat.Mtimespec.Nsec).Unix()
		//fmt.Println(fi.Mode(), fi.Name(), fi.Size(), fi.ModTime().Unix(),
		//	fi_uid, ":", fi_gid, fi_ctm, fi_atm, fi_mtm)
		//fmt.Printf("\"%s\",%v,%v\n", fi.Name(), fi.Size(), fi.ModTime().Unix())
		// fmt.Println(file)
		// temp := "\"%s\",%v,%v\n", fi.Name(), fi.Size(), fi.ModTime().Unix()
		csvWriter.Write([]string{fi.Name(), strconv.FormatInt(fi.Size(), 10), strconv.FormatInt(fi.ModTime().Unix(), 10)})
	}
}
