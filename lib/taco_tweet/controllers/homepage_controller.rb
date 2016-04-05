module TacoTweet
  class Server < Sinatra::Base
    get "/" do
      @tweets = TacoTweet::Tweet.all
      render_template("lib/taco_tweet/views/homepage.html.erb")
    end

    post "/tweets" do
      TacoTweet::Tweet.create(body: params["body"])
      redirect to("/")
    end

    def render_template(template_path)
      template = ERB.new(File.read(template_path))
      template.result(binding)
    end
  end
end
