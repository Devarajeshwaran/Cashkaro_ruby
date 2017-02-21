FROM ruby:2.3
COPY . /app
WORKDIR /app

EXPOSE 80/tcp

RUN gem install bundler
RUN bundle install

ENTRYPOINT ["/bin/bash"]

