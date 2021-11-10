package main

import (
	"fmt"
	"log"
	"os"
	"path/filepath"
	"strings"
)

func scan_recursive(dir_path string, ignore []string) ([]string, []string) {

	folders := []string{}
	files := []string{}

	//Scan
	filepath.Walk(dir_path, func(path string, f os.FileInfo, err error) error {

		_continue := false

		// Loop : Ingore Files & folders
		for _, i := range ignore {

			// if ignored path
			if strings.Index(path, i) != -1 {

				//_continue
				_continue = true
			}
		}

		if _continue == false {
			f, err = os.Stat(path)
			//if No Error
			if err != nil {
				log.Fatal(err)
			}

			//File & Folder Mode
			f_mode := f.Mode()

			// Is folder
			if f_mode.IsDir() {

				// Append to Folders Array
				folders = append(folders, path)

			} else if f_mode.IsRegular() {

				// Append to Files Array
				files = append(files, path)
			}
		}

		return nil
	})

	return folders, files
}

func main() {

	folders, files := scan_recursive(".", []string{"a"})

	//Files
	for _, i := range files {
		fmt.Println(i)
	}

	// Folders
	for _, i := range folders {
		fmt.Println(i)
	}
}
