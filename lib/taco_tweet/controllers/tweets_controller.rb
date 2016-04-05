module TacoTweet
  class Server < Sinatra::Base
    get "/api/tweets" do
      halt_unless_user

      tweets = TacoTweet::Tweet.all
      [200, tweets.to_json]
    end

    post "/api/tweets" do
      halt_unless_user

      payload = JSON.parse(request.body.read)
      [201, TacoTweet::Tweet.create(payload).to_json]
    end
  end
end
