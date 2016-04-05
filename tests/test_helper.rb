ENV["RACK_ENV"] = "test"
require "minitest/autorun"
require "rack/test"
require "pry"

require "./app"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "test.sqlite3"
)
