FROM python:3.6-alpine

RUN adduser -D flasksuperapp

WORKDIR /home/flasksuperapp

COPY requirements.txt requirements.txt
RUN python -m venv venv
RUN source venv/bin/activate
RUN venv/bin/pip install flask

COPY app.py start.sh ./ 

RUN chmod +x start.sh
RUN chown -R flasksuperapp:flasksuperapp ./
USER flasksuperapp

ENTRYPOINT ["./start.sh"]
#ENTRYPOINT ["/bin/sh"]
#aCMD ["app.py"]

