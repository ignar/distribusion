FROM ruby:2.4-onbuild

RUN mkdir -p /bundle && mkdir -p /app
WORKDIR /app
ENV BUNDLE_PATH=/bundle

RUN gem install rubygems-update
RUN update_rubygems
RUN gem install bundler --no-ri --no-rdoc
CMD ["bundle", "exec", "bundle", "version"]

CMD bin/run