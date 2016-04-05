module TacoTweet
  class Server < Sinatra::Base
    post "/login" do
      token = SecureRandom.hex
      TacoTweet::User.create(password: token)
      [201, { token: token }.to_json]
    end
  end
end
