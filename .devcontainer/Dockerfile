FROM ruby:3.4.9

RUN apt-get update -qq && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs \
    postgresql-client

WORKDIR /workspaces/app