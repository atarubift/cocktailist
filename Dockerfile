FROM ruby:3.1

RUN mkdir /cocktailist
WORKDIR /cocktailist
COPY Gemfile /cocktailist/Gemfile
COPY Gemfile.lock /cocktailist/Gemfile.lock
RUN bundle install
COPY . /cocktailist

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]