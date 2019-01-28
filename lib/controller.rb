
class ApplicationController < Sinatra::Base
  get '/' do
	erb :index
  end

  get '/gossips/new/' do
  	erb :new_gossip
  end

  post '/gossips/new/' do
  	puts "This is just a sample for the post"
  end
end