FROM jekyll/jekyll:3.8.6

USER root
RUN mkdir /app
RUN chmod 777 /app
WORKDIR /app
ADD Gemfile ./Gemfile
RUN touch ./Gemfile.lock
RUN chmod a+w ./Gemfile.lock
RUN bundle install
ADD _config.yml ./_config.yml
ADD favicon.ico ./favicon.ico
ADD index.md ./index.md
ADD assets ./assets
ENTRYPOINT ["jekyll", "serve"]

# docker build -t blog .
# docker run --rm -it -e "JEKYLL_ENV=docker" -p 4000:4000 -v ${pwd}/docs:/app/docs blog:latest