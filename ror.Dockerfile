FROM rails:latest

RUN apt update && apt install -y --force-yes postgresql-client-9.4
RUN echo 'gem: --no-document' > /etc/gemrc
RUN mkdir -p /gemfile
ADD Gemfile /gemfile
RUN cd /gemfile && bundle install