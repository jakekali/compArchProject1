# Computer Architecture Project 1

## Installation Method 1
1. Download the bash script using curl: 
```bash
curl https://raw.githubusercontent.com/jakekali/compArchProject1/main/runme --output runme
```
1. Change the permissions on the bash script file - runme
```bash
chmod 744 runme
```
1. Run the runme bash file: 
```bash
./runme
```

## Installation Method 2
Download the assembly file from github using curl:
```bash
curl https://raw.githubusercontent.com/jakekali/compArchProject1/main/jag.s --output jag.s
```
Download the make file from github using curl: 
```bash
curl https://raw.githubusercontent.com/jakekali/compArchProject1/main/makefile --output makefile
```
Change the permissions on the makefile: 
```bash
chmod 744 makefile
```
Run the Makefile in the directory downloaded: (it might throw an error, but u can ignore it, the file still generates)
```bash
make
```
Run the exectutable generated: 
```bash
./jag.out
```

