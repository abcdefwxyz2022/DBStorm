#!/bin/sh
k=0
while [ $k -lt $1 ]
do
j=1
while [ $j -lt 6 ]
do
((time=$(date +%s)))
config=$j"w"
echo "start mession-"$config"-"$k" at "$(date +%Y-%m-%d,%H:%M:%S)
echo "runing orca with $config..."
java -jar orca-730c.jar orca postgresql orcadb0 $config ./out > ./log/out.log  #2>./log/err.log

((j=j+1))
done
((k=k+1))
done
