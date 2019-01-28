require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
	erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
  	erb :new_gossip
  end

  get '/gossips/:id/' do |id|
  	  Gossip.find("#{params[:id]}")
  	  erb :gossips_show
  end

  post '/gossips/new/' do
  	Gossip.new("#{params["gossip_author"]}", "#{params["gossip_content"]}").save
  	puts "Salut, je suis dans le serveur"
	puts "Ceci est mon super params : #{params}"
	redirect "/"
  end
end