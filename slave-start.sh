#!/bin/bash

if [ $# -eq 0 ]
then
	echo "Usage $0 number [cores per container] [start port]"
	exit
fi
 
PORTCOUNT=1

if [ $# -gt 1 ]
then
	CORES=$2
else
	CORES=1
fi

if [ $# -gt 2 ]
then
	PORT=$3
else
	PORT=8081
fi

while [ $PORTCOUNT -le $1 ]
do

	echo "Starting Slave #$PORTCOUNT on port $PORT"

	docker run -d -h spark-slave -m 600m -p=$PORT:$PORT --link spark-master:spark-master mbechauf/spark slave $PORT $CORES

	PORTCOUNT=$(($PORTCOUNT + 1))
	PORT=$(($PORT + 1))

done



