require "active_record"

module TacoTweet
  class Tweet < ActiveRecord::Base
    validates :body, presence: true
  end
end
