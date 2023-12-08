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
