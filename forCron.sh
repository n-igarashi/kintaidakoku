#!/bin/bash

cd $(dirname $0)
. config.txt

echo "run">> log.txt

$pythonPath kintaidakoku.py $id $pass $chromeDPath

killall Terminal