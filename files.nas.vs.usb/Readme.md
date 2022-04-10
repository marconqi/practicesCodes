# This project is used to manage and remove files in the storage
Working steps:
1. using "md5" to generate the md5 and file list. The command is `md5 -r ./folder > filelist`
2. Run `filterSource.py` to transfer the format and sorted the list. The command is `filterSource.py --input inpoutfileName --outut outputfile.csv`
3. Run `findDuplicate.py` to remove the duplicated or noused files. `findDuplicate.py --source source.csv --target targetFolder --dry False`