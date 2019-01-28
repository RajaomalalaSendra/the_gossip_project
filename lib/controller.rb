
class ApplicationController < Sinatra::Base
  get '/' do
	erb :index
  end
  get '/gossip/new' do
  	erb :new_gossip
  end
end