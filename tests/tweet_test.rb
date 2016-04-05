ENV["RACK_ENV"] = "test"
require "minitest/autorun"
require "pry"

require "./lib/taco_tweet"

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "test.sqlite3"
)

class TweetTest < Minitest::Test
  def test_tweet_exists
    assert TacoTweet::Tweet
  end

  def test_can_init_a_tweet
    tweet = TacoTweet::Tweet.new(body: "Hello Taco!")
    assert_equal TacoTweet::Tweet, tweet.class
    assert_equal nil, tweet.id
  end

  def test_create_a_tweet
    tweet = TacoTweet::Tweet.create(body: "Hello Taco!")
    assert_equal TacoTweet::Tweet, tweet.class
    assert_equal false, tweet.id.nil?
  end
end
