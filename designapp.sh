#!/bin/bash

mkdir tempdir
mkdir tempdir/templates
mkdir tempdir/static

cp designapp.py tempdir/.
cp -r templates/* tempdir/templates/.
cp -r static/* tempdir/static/.

echo "From python" > tempdir/Dockerfile
echo "RUN pip install flask" >> tempdir/Dockerfile
echo "COPY /static /home/myampp/static/" >> tempdir/Dockerfile
echo "COPY ./templates /home/myapp/template" >> tempdir/Dockerfile
echo "COPY designapp.py /home/myapp" >> tempdir/Dockerfile
echo "EXPOSE 5050" >> tempdir/Dockerfile
echo "CMD python3 /home/myapp/designapp.py" >> tempdir/Dockerfile

cd tempdir
docker build -t project .
docker run -t -d -p 5050:5050 --name project project
docker ps -a