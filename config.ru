require 'rubygems'
require 'bundler/setup'
require 'yaml'
# load all the gems in the Gemfile
Bundler.require(:default, ENV['RACK_ENV'] || 'development')

# load all the environment variables
Dotenv.load

# APP_ENV REDIS_ENV are global variables
APP_ENV = ENV['RACK_ENV'] || 'development'
REDIS_ENV = YAML.load(File.read(File.expand_path('../config/redis.yml', __FILE__)), symbolize_names: true)

# set up redis connection
Ohm.redis = Redic.new(REDIS_ENV[APP_ENV.to_sym][:url])
puts Ohm.redis.call("PING")

# load all the files in the app folder
require './app/server'

run Sinatra::Application