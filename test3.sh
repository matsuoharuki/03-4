#!/bin/sh
gcc main.c -o test3

function func(){
input=$(<data3/input.txt)
./test3 << EOF
$input
EOF
}

git log --oneline -n 1 | cut -d ' ' -f 1  >>log.txt

echo $(func)> ./data3/result.txt
check=`diff ./data3/output.txt ./data3/result.txt`

if test $check -z
then
    echo "test3 success"
    exit 0
else
    echo 'test3 failed'
    exit 1
fi
