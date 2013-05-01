require 'sinatra'
require 'sinatra/json'
require 'twitter'
require './duration'
require './settings'

include Duration
include Settings

get '/' do
  redirect '/index.html'
end

get '/lists' do
  client = Twitter::Client.new(
      :consumer_key => consumer_key,
      :consumer_secret => consumer_secret,
      :oauth_token => oauth_token,
      :oauth_token_secret => oauth_token_secret
    )

  lists = client.lists.sort_by { |list| list.name }

  json (lists.map { |list| { :name => list.name, :tweets =>  get_tweets(list.name, client)} })
end

def get_tweets(list_name, client)
  client.list_timeline(list_name, :count => 20).map { | tweet |
    {
      :author => tweet.from_user,
      :text => tweet.text,
      :time_ago => duration(Time.now, tweet.created_at)
    }
  }
end