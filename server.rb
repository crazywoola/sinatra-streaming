require "rubygems"
require "bundler/setup"
require "yaml"
# load all the gems in the Gemfile
Bundler.require(:default, ENV["RACK_ENV"] || "development")

# load all the environment variables
Dotenv.load

# APP_ENV REDIS_ENV are global variables
APP_ENV = ENV["RACK_ENV"] || "development"
REDIS_ENV = YAML.load(File.read(File.expand_path("../config/redis.yml", __FILE__)), symbolize_names: true)

# set up redis connection
Ohm.redis = Redic.new(REDIS_ENV[APP_ENV.to_sym][:url])

puts "APP_ENV: #{APP_ENV} REDIS_STATUS: #{Ohm.redis.call("PING") rescue "REDIS DOWN"}"

module Application
  module Utils
    Dir.glob("./app/utils/*.rb").each { |file| require file }
  end

  module Models
    Dir.glob("./app/models/*.rb").each { |file| require file }
  end

  module Services
    Dir.glob("./app/services/*.rb").each { |file| require file }
  end

  module API
    Dir.glob("./app/api/*.rb").each { |file| require file }
  end
end
  
