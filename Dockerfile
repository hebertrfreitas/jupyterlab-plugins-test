FROM python:3.9-slim-bullseye
RUN apt update && apt install -y gcc python3-dev netcat curl git
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt


RUN useradd -ms /bin/bash runjupyter
USER runjupyter
WORKDIR /app

CMD ["jupyter lab --ip 0.0.0.0 --no-browser"]
ENTRYPOINT ["/bin/bash", "-c"]
EXPOSE 8888