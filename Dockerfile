FROM ruby:3.2.2
WORKDIR /app
EXPOSE 8000
COPY ./Gemfile ./Gemfile.lock ./
RUN gem install bundler && bundle install
COPY . .
RUN rails RAILS_ENV=production db:create
RUN rails RAILS_ENV=production db:migrate
RUN rails RAILS_ENV=production db:seed
CMD bundle exec puma -e production -p 8000
