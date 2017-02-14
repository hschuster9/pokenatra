require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

require_relative 'db/connection'

require_relative 'models/pokemon'

get '/pokemons' do
  @pokemons = Pokemon.all
  erb :index
end

get 'pokemons/new' do
  erb :"pokemons/new"
end

get '/pokemons/:id' do
  @pokemon = Pokemon.find(params[:id])
  erb :show
end

post '/pokemons' do
  @pokemon = Pokemon.create(name: params[:name], cp: params[:cp], poke_type: params[:poke_type])
  redirect "/pokemons/#{@pokemon.id}"
end
