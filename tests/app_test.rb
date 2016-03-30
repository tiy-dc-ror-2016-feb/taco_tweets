ENV["RACK_ENV"] = "test"
require 'minitest/autorun'
require 'rack/test'
require 'pry'

require './app'

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_tacos_are_still_tacos
    assert true
  end

  def test_get_returns_empty_json_when_no_taco_tweet
    response = get "/tweets"
    json = JSON.parse(response.body)
    assert_equal [], json
  end

  def test_get_a_list_of_tweets
    tweet = Tweet.create(body: "Hello Taco!")
    response = get "/tweets"
    json = JSON.parse(response.body)
    assert_equal tweet.body, json["body"]
  end
end
