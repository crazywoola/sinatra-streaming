# Base image
FROM ruby:3.2.2-bullseye

# Set the working directory
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the working directory
COPY Gemfile Gemfile.lock ./

# Install dependencies
RUN bundle install --binstubs

# Copy the rest of the applica tion code to the working directory
COPY . .

# Copy the config files
RUN chmod +x bin/setup && ./bin/setup

EXPOSE 9292
# Expose the desired port
CMD [ "puma -t 4:16 -w 2" ]