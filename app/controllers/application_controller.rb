class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  require 'pry'

  #welcome
  get '/' do
    erb :welcome
  end

  #index
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  #new
  get '/recipes/new' do
    erb :new
  end

  #create
  post '/recipes' do
    recipe = Recipe.create(params[:recipe])
    redirect "/recipes/#{recipe.id}"
  end

  #show
  get '/recipes/:id' do
    @recipes = Recipe.find(params[:id])
    erb :show
  end

  #edit
  get '/recipes/:id/edit' do

    @recipes = Recipe.find(params[:id])
    erb :edit
  end

  #Update
  patch '/recipes/:id' do
    recipe = Recipe.find(params[:id])
    recipe.update(params[:recipe])
    redirect "/recipes/#{recipe.id}"
  end

  #Destroy
  delete '/recipes/:id/delete' do
    Recipe.find(params[:id]).destroy
    redirect "/recipes"
  end

end
