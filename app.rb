ENV["RACK_ENV"] = ENV["ENV"] || "development"
require 'sinatra'
require 'json'
require 'yaml'
require 'active_record'
require './lib/taco_tweet'
require 'pry'

config_file = File.read "./db/database.yml"
config = YAML.load config_file

ActiveRecord::Base.establish_connection(config[ENV["RACK_ENV"]])

ActiveRecord::Migration.verbose = false

helpers do
  def current_user
    TacoTweet::User.where(password: request.env["HTTP_X_TACO_TOKEN"]).first
  end

  def halt_unless_user
    halt 401, {msg: "go away!"}.to_json unless current_user
  end
end

post '/login' do
  token = SecureRandom.hex
  TacoTweet::User.create(password: token)
  {token: token}.to_json
end

get '/tweets' do
  halt_unless_user

  tweets = TacoTweet::Tweet.all

  [200, tweets.to_json]
end

post '/tweets' do
  payload = JSON.parse(request.body.read)
  TacoTweet::Tweet.create(payload).to_json
end
