ENV["RACK_ENV"] = "test"
require 'minitest/autorun'
require 'pry'

require './tweet'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'test.sqlite3'
)

class TweetTest < Minitest::Test

  def test_tweet_exists
    assert Tweet
  end

  def test_can_init_a_tweet
    tweet = Tweet.new(body: "Hello Taco!")
    assert_equal Tweet, tweet.class
    assert_equal nil, tweet.id
  end

  def test_create_a_tweet
    tweet = Tweet.create(body: "Hello Taco!")
    assert_equal Tweet, tweet.class
    assert_equal false, tweet.id == nil
  end
end
