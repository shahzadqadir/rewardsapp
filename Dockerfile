FROM python:3.10-alpine

RUN pip install pipenv

WORKDIR /code
COPY Pipfile Pipfile.lock /code/

RUN pipenv install --deploy --ignore-pipfile

COPY . /code/

EXPOSE 8005

CMD ["pipenv", "run", "python3", "manage.py", "runserver", "0.0.0.0:8005"]