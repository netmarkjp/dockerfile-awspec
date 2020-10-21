FROM ruby:2.7-slim-buster

# ENV GEM_HOME=/usr/local/bundle
# ENV BUNDLE_APP_CONFIG=/usr/local/bundle
ENV BUNDLE_SILENCE_ROOT_WARNING=0

RUN mkdir /opt/awspec

COPY Gemfile Gemfile.lock /opt/awspec/
RUN cd /opt/awspec && bundle install --jobs=$(nproc)

RUN apt-get -y update \
    && apt-get -y install sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*
RUN useradd -u 1000 work \
    && echo '#1000 ALL=(ALL:ALL) NOPASSWD:ALL' | tee -a /etc/sudoers

ENTRYPOINT ["bundle", "exec"]
