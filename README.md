# Computer Architecture ECE251 Project 1
## Purpose / Goal

For project #1, you will ask the user to input 2 strings and concatenate the two. Both strings will have at most 12 ASCII characters. You will ask the user to enter the first string after which they will hit enter. If the number of characters exceeds the 12-character limit, you will print an error and exit the program with a 7 return code. If the number of characters is less than or equal to 12 characters, you will ask them to enter another string. If the second string exceeds the character limit, your program should print an error message and exit with an 8 return code. If both strings meet the requirements, you will then output the concatenated string to stdout and return an error code that consists of the total number of characters in the concatenated string.

## Installation Method 1 (Recommended) 
1. Download the bash script using curl: 
```bash
curl https://raw.githubusercontent.com/jakekali/compArchProject1/main/runme --output runme
```
2. Change the permissions on the bash script file - runme
```bash
chmod 744 runme
```
3. Run the runme bash file: 
```bash
./runme
```

## Installation Method 2
1. Download the assembly file from github using curl:
```bash
curl https://raw.githubusercontent.com/jakekali/compArchProject1/main/jag.s --output jag.s
```
2. Download the make file from github using curl: 
```bash
curl https://raw.githubusercontent.com/jakekali/compArchProject1/main/makefile --output makefile
```
3. Change the permissions on the makefile: 
```bash
chmod 744 makefile
```
4. Run the Makefile in the directory downloaded: (it might throw an error, but u can ignore it, the file still generates)
```bash
make
```
5. Run the exectutable generated: 
```bash
./jag.out
```

## Design Document
The Design Document can be found [here](../main/Design%20Document%20-%20Project%20%231.pdf) 
