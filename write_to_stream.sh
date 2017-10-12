#!/bin/bash

source tk_env
data=`cat data/one.json`

while :
do
   aws kinesis put-record --stream-name "911-stream-01" --data "$data" --partition-key ExplicitHashKey   
   aws kinesis put-record --stream-name "911-stream-01" --data "$data" --partition-key ExplicitHashKey   
   aws kinesis put-record --stream-name "911-stream-01" --data "$data" --partition-key ExplicitHashKey   

   sleep 1
done
