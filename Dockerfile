FROM ruby:2.4

#RUN apk update
#RUN apk add build-base
#RUN apk add git
#RUN apk add ruby ruby-dev ruby-rdoc ruby-irb
#RUN apk add libxslt libxslt-dev
#RUN apk add libxml2 libxml2-dev
#RUN apk add libffi libffi-dev
#RUN apk add zlib zlib-dev
#RUN rm /var/cache/apk/*

#RUN apt-get install sqlite3 libsqlite3-dev
RUN apt-get update && apt-get install -y \
		sqlite3 \
		libsqlite3-dev \
    imagemagick

ENV APP_PATH=/app
WORKDIR $APP_PATH
# ADD Gemfile* $APP_PATH/
ADD . $APP_PATH

#RUN gem install nokogiri -- --use-system-libraries
#RUN gem install ffi -- --use-system-libraries
#RUN gem install rerun
#RUN gem install grape
#RUN gem install rack
#RUN gem install rack-cors
#RUN gem install garner
#RUN gem install specific_install
RUN bundle install
RUN bundle update

# CMD ["/usr/bin/irb"]
# CMD ["shotgun", "-o", "0.0.0.0"]
# CMD ["rackup"]
# CMD ["unicorn", "--config-file", "config/unicorn.rb"]
CMD ["unicorn"]
