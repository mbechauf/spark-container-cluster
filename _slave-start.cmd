rem for /f "delims=" %%a in ('boot2docker ip') do @set HOST_IP=%%a


docker run -d -h spark-slave -p=8081:8081 --link spark-master:spark-master mbechauf/spark slave 


