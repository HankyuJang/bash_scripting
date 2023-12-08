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

## Conditional
- `if`-`then`-`else`-`fi`.
  - Note: must put spaces around the `[` adn `]`

```
% cat conditional.sh
read name
if [ $name == "Hankyu" ]
then
    echo match
else
    echo mismatch
fi
% ./conditional.sh 
Hankyu # NOTE: this is the input from the terminal
match
```

## Other operators
- `&&`: and
- `||`: or
- `==`: equal to
- `!=`: not equal to
- `<=`: less than or equal to. Same as using `-le` 
- `$(( calculations ))`: arithmetic calculations
  - NOTE: bash only handles integers. Division results in truncating decimal points

```
% num1=1 ; num2=2 ; echo $(($num1 + $num2))
3

% num1=1 ; num2=2 ; echo $(($num1 / $num2))
0
```

## Arrays
- Space delimited list contained in parentheses
- Use `declare -a` to create an empty array or initialize with elements.
- NOTE: indexing starts from 0

```
% name_array1 = (Hankyu John)
zsh: unknown file attribute: H
@Hankyus-MacBook-Pro scripts % name_array1=(Hankyu John) 
@Hankyus-MacBook-Pro scripts % echo $name_array1[0]

@Hankyus-MacBook-Pro scripts % echo $name_array1[1]
Hankyu
@Hankyus-MacBook-Pro scripts % echo $name_array1[2]
John
@Hankyus-MacBook-Pro scripts % echo $name_array1[@] # print all elements
Hankyu John

% declare -a name_array2
% name_array2+=("Hankyu")
% name_array2+=("Jacob") 
% echo $name_array2[@]  
Hankyu Jacob
```

## `for` loop

Here are 3 ways (could be more) to using for loops

```
% cat for_loops.sh 
name_array=("Hankyu" "John" "David")
for name in ${name_array[@]}
do
    echo $name
done

for i in ${!name_array[@]}
do
    echo ${name_array[i]}
done

for (( i=0; i<=3; i++ ))
do
    echo $i
done

% ./for_loops.sh  
Hankyu
John
David
Hankyu
John
David
0
1
2
3
```

## Practice wrangling
- Q1: from `data/full_names.csv`, create two `arrays` namely `col1` and `col2` with the elements in the first and second column, respectively.

```
% filename=data/full_names.csv
% col1=($(cut -d "," -f 1 $filename))
% echo ${col1[@]}
Hankyu Hankyu John Alice Brandon
```
