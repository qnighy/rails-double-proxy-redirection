FROM ruby:3.2.0-bullseye

RUN mkdir -p /app
WORKDIR /app
COPY Gemfile Gemfile.lock /app/
RUN bundle install --frozen
COPY . /app/

CMD ["bin/rails", "s", "-b", "0.0.0.0"]
