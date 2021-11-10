FROM ruby:3.0.0-alpine
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY . /usr/src/app
RUN bundle install
CMD ["bin/tictactoe.rb"]
