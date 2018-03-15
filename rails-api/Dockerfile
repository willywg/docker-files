FROM ruby:2.5.0

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
  && apt-get update -qq \
  && apt-get install -y \
  nodejs \
  yarn \
  libcurl3 \
  libcurl3-gnutls \
  libcurl4-openssl-dev

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

ADD Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
  BUNDLE_JOBS=2 \
  BUNDLE_PATH=/bundle \
  GEM_HOME=/bundle

RUN bundle install

ADD . $APP_HOME

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*%