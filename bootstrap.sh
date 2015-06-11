#!/bin/bash

echo "Starting image ..."

if [ "$1" = "master" ]
then
	echo "Starting Spark Master"
	/usr/local/spark/sbin/start-master.sh
	daemon=1 
elif [ "$1" = "slave" ]
then
	if [ "$#" -eq "3" ]
	then
		CORES=$3
	else
		CORES=1
	fi
	echo "Starting Spark Slave on webui-port $2 with $CORES cores"
	/usr/local/spark/sbin/start-slave.sh 1 spark://spark-master:7077 -c $CORES --webui-port $2
	daemon=1 
elif [ "$1" = "bash" ]
then
	bash
fi

if [ "$daemon" = "1" ]; then
	while true; do sleep 1000; done
else
	echo "exiting ..."
fi




