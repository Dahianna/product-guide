FROM ruby:2.6.1

# Bundle install first for a simple gem cache
COPY Gemfile* /tmp/
WORKDIR /tmp
RUN bundle install

# Set app working directory and copy app there.
ENV app /product-guide
RUN mkdir $app
WORKDIR $app

# Set some other necessary ENVs
ENV LC_ALL=C.UTF-8

CMD bundle exec jekyll serve --host 0.0.0.0 --incremental
