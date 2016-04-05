ENV["RACK_ENV"] = "test"
require "minitest/autorun"
require "rack/test"
require "pry"

require "./lib/taco_tweet"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "test.sqlite3"
)
