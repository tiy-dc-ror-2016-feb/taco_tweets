require_relative "test_helper"

class HomepageTest < Minitest::Test
  include Rack::Test::Methods

  def app
    TacoTweet::Server
  end

  def test_we_have_a_homepage
    response = get("/")
    assert_equal 200, response.status
  end

  def test_homepage_will_display_latest_tweet
    TacoTweet::Tweet.create(body: "IAMUNIQUE")
    response = get("/")

    assert response.body.include?("IAMUNIQUE")
  end

  def test_can_create_a_quick_tweet
    response = post("/tweets")

    assert_equal "", response.body
  end
end
