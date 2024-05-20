# syntax = docker/dockerfile:1
FROM ruby:3.0-slim
ENV BUNDLE_PATH="$GEM_HOME" \
    BUNDLE_BIN="$GEM_HOME/bin" \
    BUNDLE_SILENCE_ROOT_WARNING=1 \
    BUNDLE_APP_CONFIG="$GEM_HOME" \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    GEM_HOME=/usr/local/bundle
ENV PATH="$BUNDLE_BIN:$PATH"
ENV LANG=C.UTF-8

RUN <<-EOT
    set -xe
    apt-get update
    apt-get install -y build-essential git
EOT

WORKDIR /app

COPY Gemfile* *.gemspec /app/
COPY lib /app/lib
COPY exe /app/exe
RUN <<-EOT
    set -xe
    BUNDLER_VERSION=`sed -n '/BUNDLED WITH/,/[\d\. ]+/p' Gemfile.lock | tr '\n'  '  ' | awk '{print $3}'`
    gem install -v "$BUNDLER_VERSION" bundler
    bundle config --local without "development:test"
    bundle config --local deployment true
    bundle config set force_ruby_platform true
    bundle config --local disable_platform_warnings true
    bundle install
    adduser app --disabled-password --gecos ""
EOT

COPY . /app/
RUN chown -R app:app /app
USER app

CMD ["bash"]
