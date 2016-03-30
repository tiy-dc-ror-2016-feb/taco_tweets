require 'sinatra'
require 'json'
require 'active_record'

get '/tweets' do
  [].to_json
end
