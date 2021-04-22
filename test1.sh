#!/bin/sh
rm ./test1 
gcc main.c -o test1

function func(){
input=$(<data1/input.txt)
./test1 << EOF
$input
EOF
}

result=$(func)
result=(${result// /\n})

git log --oneline -n 1 | cut -d ' ' -f 1  >>log.txt
output=(`cat data1/output.txt|xargs`)

num_ans=${#output[*]}
check=0

#出力の数が一致しているかの検証
if test ${#result[*]} -ne $num_ans
then
    echo 'test1 failed1'
    exit 1
fi

#出力値の比較
for ((i=0;i < $num_ans;i++));
do
    if test ${result[i]} -ne ${output[i]};
    then
        echo 'test1 failed'
        exit 1
    else
        check=`expr $check + 1`
    fi
done

if test $check -eq $M
then
    echo "test1 success"
    exit 0
else
    echo 'test1 failed'
    exit 1
fi

    