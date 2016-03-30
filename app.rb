require 'sinatra'
require 'json'
require 'active_record'
require './tweet'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db.sqlite3'
)

require './migration'

# UserAndTweetMigration.migrate(:up)


get '/tweets' do
  tweets = Tweet.all

  [200, tweets.to_json]
end

post '/tweets' do
  payload = JSON.parse(request.body.read)
  Tweet.create(payload).to_json
end
