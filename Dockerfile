FROM ruby:2.7-slim-buster

# ENV GEM_HOME=/usr/local/bundle
# ENV BUNDLE_APP_CONFIG=/usr/local/bundle
ENV BUNDLE_SILENCE_ROOT_WARNING=0

RUN mkdir /opt/awspec
COPY Gemfile Gemfile.lock /opt/awspec/
RUN cd /opt/awspec && bundle install --jobs=$(nproc)

ENTRYPOINT ["bundle", "exec"]
