#!/bin/sh
gcc main.c -o test2

function func(){
input=$(<data2/input.txt)
./test2 << EOF
$input
EOF
}

git log --oneline -n 1 | cut -d ' ' -f 1  >>log.txt

echo $(func)> ./data2/result.txt
check=`diff ./data2/output.txt ./data2/result.txt`

if test $check -z
then
    echo "test2 success"
    exit 0
else
    echo 'test2 failed'
    exit 1
fi
