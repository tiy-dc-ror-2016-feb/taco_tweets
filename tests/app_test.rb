ENV["RACK_ENV"] = "test"
require "minitest/autorun"
require "rack/test"
require "pry"

require "./app"

class AppTest < Minitest::Test
  include Rack::Test::Methods

  def setup
    TacoTweet::Tweet.delete_all
  end

  def app
    TacoTweet::Server
  end

  def stub_session
    token = SecureRandom.hex
    TacoTweet::User.create(password: token)
    header("X_TACO_TOKEN", token)
  end

  def test_tacos_are_still_tacos
    assert true
  end

  def test_login_returns_token
    response = post "/login"
    json_body = JSON.parse(response.body)
    assert_equal true, json_body.key?("token")
  end

  def test_login_returns_token_of_specifed_length
    response = post "/login"
    json_body = JSON.parse(response.body)
    assert_equal 32, json_body["token"].size
  end

  def test_gets_tweets_will_send_401_if_unauthorized
    response = get "/tweets"
    json = JSON.parse(response.body)
    assert_equal 401, response.status
  end

  def test_gets_tweets_will_tell_someone_to_go_away
    response = get "/tweets"
    json = JSON.parse(response.body)
    assert_equal({ "msg" => "go away!" }, json)
  end

  def test_get_returns_empty_json_when_no_taco_tweet
    stub_session

    response = get "/tweets"
    json = JSON.parse(response.body)
    assert_equal [], json
  end

  def test_get_a_list_of_tweets
    stub_session

    tweet = TacoTweet::Tweet.create(body: "Hello Taco!")
    response = get "/tweets"
    json = JSON.parse(response.body)
    assert_equal tweet.body, json.last["body"]
  end
end
