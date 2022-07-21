#! /bin/bash

heroku container:push -a teastdartcontainer web
heroku container:release -a teastdartcontainer web