FROM alpine:latest

RUN apk add python3 py3-pip
RUN apk add git
RUN pip3 install gitpython

RUN mkdir /app
WORKDIR /app
RUN echo "from git import Repo" > clone_git.py
RUN echo "repo = Repo.clone_from(url=\"https://github.com/Laclaque/Tasks-code\", to_path='cloned_repo')" >> clone_git.py
RUN chmod 777 clone_git.py
RUN python3 clone_git.py

ENTRYPOINT ["/usr/bin/python3", "/app/cloned_repo/nnn-dames.py"]
CMD ["n", "id", "0", "0"]