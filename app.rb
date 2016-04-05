ENV["RACK_ENV"] = ENV["ENV"] || "development"
require "sinatra"
require "json"
require "yaml"
require "active_record"
require "./lib/taco_tweet"
require "pry"

config_file = File.read "./db/database.yml"
config = YAML.load config_file

ActiveRecord::Base.establish_connection(config[ENV["RACK_ENV"]])

ActiveRecord::Migration.verbose = false
