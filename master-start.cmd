rem for /f "delims=" %%a in ('boot2docker ip') do @set HOST_IP=%%a

docker run -d -h spark-master -m 600m -p=7077:7077 -p=6066:6066 -p=8080:8080 --name spark-master mbechauf/spark master 


