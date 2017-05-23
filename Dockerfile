FROM ruby:2.4.1

RUN apt-get update -yqq \
  && apt-get install -yqq --no-install-recommends \
    postgresql-client \
    nodejs \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists

# Pre-install gems with native extensions
RUN gem install nokogiri -v "1.6.8.1"

WORKDIR /Users/rajkiran/Desktop/ror/meal_plan/app
COPY Gemfile* ./
RUN bundle install
COPY . .

CMD script/start