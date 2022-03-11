FROM ruby:2.7.0
RUN apt-get update -qq \
    && apt-get install -y npm postgresql-client
RUN npm install --global yarn n
RUN n 16.4.0
ADD . /todoapp-test
WORKDIR /todoapp-test
RUN bundle install
RUN bundle exec rails webpacker:install
RUN mkdir tmp/db && chmod -R 777 tmp/db
EXPOSE 3000
CMD ["bundle", "exec", "rails", "s", "-b", "0.0.0.0"]