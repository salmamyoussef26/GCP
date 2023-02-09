FROM python:3.7.16-alpine3.16
WORKDIR /final_task_app
COPY requirements.txt /final_task_app
RUN pip install --upgrade pip
RUN pip install -r requirements.txt --no-cache-dir
COPY . /final_task_app
CMD export $(cat .env | xargs) && python3 hello.py
