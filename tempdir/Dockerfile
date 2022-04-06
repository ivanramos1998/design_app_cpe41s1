From python
RUN pip install flask
COPY /static /home/myampp/static/
COPY ./templates /home/myapp/template
COPY designapp.py /home/myapp
EXPOSE 5050
CMD python3 /home/myapp/designapp.py
