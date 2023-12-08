# Shell scripting basics

## Save a user's input to a variable

- `read`: let's user to type in text. Saves it as a variable

```
% read lastname
Jang # NOTE: I typed in this in the terminal.
% echo $lastname 
Jang
```

## Metacharacters

- `#`: comment
- `;`: command separator
- `*`: wildcard
- `?`: single character wildcard
- `\`: allows to use metacharacter as a character
- `' '`: interpret literally
- `" "`: similar to single quotes, BUT evaluates metacharacters

```
% ls data/????_names*
data/full_names.csv	data/full_names.txt	data/last_names.txt

% ls data/?????_names*
data/first_names.txt

% echo '$1 #hi'
$1 #hi

% echo "$1 #hi"
 #hi

% echo "\$1 #hi" 
$1 #hi
```

## Input and output redirection

- `>`: Redirect output to the file (Creates a new file. If there exists a file with a same name, it overwrites!)
- `>>`: Append output to the file
- `2>`: Redirect standard error to file
- `2>>`: Appends standard error to file
- `<`: Redirect file contents to standard input

```
% echo "Hi Hankyu" > data/welcome.txt
% cat data/welcome.txt
Hi Hankyu

% echo "Hi Hankyu Jang" > data/welcome.txt
% cat data/welcome.txt
Hi Hankyu Jang

% echo "Hi Hankyu Jang. Hello again" >> data/welcome.txt
% cat data/welcome.txt
Hi Hankyu Jang
Hi Hankyu Jang. Hello again

% hello this will yield error message
zsh: command not found: hello

% hello this will yield error message 2> data/error_message.txt
% cat data/error_message.txt
zsh: command not found: hello

% sort < data/full_names.txt
Alice	Cooper
Brandon	Smith
Hankyu	Jang
Hankyu	Jang
John	Davis
```

## Passing arguments to a bash script

## Batch mode vs concurrent (parallel) mode
- Batch mode: commands run sequentially. command1 ; command2
- Concurrent mode: commands run in parallel. command1 & command2

