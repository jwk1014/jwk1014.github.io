#!/bin/sh
docker run --rm -it -e "JEKYLL_ENV=docker" -p 4000:4000 -v $PWD/docs:/app/docs blog:latest