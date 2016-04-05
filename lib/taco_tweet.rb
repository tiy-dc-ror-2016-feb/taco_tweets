require "erb"
require "sinatra/base"
require "json"
require "yaml"
require "active_record"

require "./lib/taco_tweet/tweet"
require "./lib/taco_tweet/user"
require "./lib/taco_tweet/server"
require "./lib/taco_tweet/controllers/tweets_controller"
require "./lib/taco_tweet/controllers/login_controller"
require "./lib/taco_tweet/controllers/homepage_controller"

module TacoTweet
end # => :tweet
