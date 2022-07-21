#! /bin/bash

heroku container:push -a teastdartcontainer web --remote docker
heroku container:release -a teastdartcontainer web --remote docker