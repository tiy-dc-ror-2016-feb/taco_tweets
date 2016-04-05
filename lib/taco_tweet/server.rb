module TacoTweet
  class Server < Sinatra::Base
    helpers do
      def current_user
        TacoTweet::User.where(password: request.env["HTTP_X_TACO_TOKEN"]).first
      end

      def halt_unless_user
        halt 401, { msg: "go away!" }.to_json unless current_user
      end
    end
  end
end
