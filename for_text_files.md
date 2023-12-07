# Useful commands to view or edit text files

## Data

```
% cat data/first_names.txt 
Hankyu
Hankyu
John
Alice
Brandon

% cat data/last_names.txt 
Jang
Jang
Davis
Cooper
Smith
```

## View

- `more`: display lines till the contents fits the terminal window. Use space bar to see the next page.
- `less`: allows to navigate up or down.
- `cat`, `head`, `tail`: prints the contents (entire, top, bottom)

## Simple wrangling

- `sort`: print the sorted lines alphanumerically. Original text is not modified.
  - `-r`: reverse order

```
% sort data/first_names.txt 
Alice
Brandon
Hankyu
Hankyu
John
```

- `uniq`: drop lines that are identical and consecutive.

```
% uniq data/first_names.txt 
Hankyu
John
Alice
Brandon
```

## Merge files by line (e.g., add columns)

- `paste`: merge lines of multiple files together
  - `-d`: specify delimiter. Default is `Tab`
```
% paste data/first_names.txt data/last_names.txt 
Hankyu	Jang
Hankyu	Jang
John	Davis
Alice	Cooper
Brandon	Smith

% paste data/first_names.txt data/last_names.txt >> data/full_names.txt

% cat data/full_names.txt 
Hankyu	Jang
Hankyu	Jang
John	Davis
Alice	Cooper
Brandon	Smith

% paste -d "," data/first_names.txt data/last_names.txt >> data/full_names.csv

% cat data/full_names.csv 
Hankyu,Jang
Hankyu,Jang
John,Davis
Alice,Cooper
Brandon,Smith
```

## Extract lines with a pattern 

- `grep`: search a pattern
  - `-n`: print line number
  - `-c`: get counts
  - `-i`: ignore the case
  - `-v`: print lines those that do NOT match the pattern
  - `-w`: print only if the pattern matches the whole word

```
% grep kyu data/first_names.txt 
Hankyu
Hankyu

% grep -n kyu data/first_names.txt 
1:Hankyu
2:Hankyu

% grep -c kyu data/first_names.txt
2

% grep -i KYU data/first_names.txt
Hankyu
Hankyu

% grep -v kyu data/first_names.txt  
John
Alice
Brandon

% grep -w kyu data/first_names.txt  # NOTE: nothing is printed. No matching word.
```

## Extract fields from lines

- `cut`: view only specific fields
  - `-c`: cut by specified number of characters
  - `-d`: cut by delimiter
  - `-f`: denote which field to show (after cutting by delimiter)

```
% cut -c -2 data/first_names.txt
Ha
Ha
Jo
Al
Br

% cut -c 2- data/first_names.txt
ankyu
ankyu
ohn
lice
randon

% cut -d "," -f1 data/full_names.csv
Hankyu
Hankyu
John
Alice
Brandon

% cut -d "," -f2 data/full_names.csv 
Jang
Jang
Davis
Cooper
Smith
```







