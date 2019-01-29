class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #create new
  get '/recipes/new' do
    erb :"../views/new"
  end
  post '/recipes' do
    @recipe = Recipe.create(params) 
    redirect to "/recipes/#{Recipe.last.id}"
  end

  #read
  get '/recipes' do
    @recipes = Recipe.all
    erb :"../views/index"
  end
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :"../views/show"
  end

  #edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :"../views/edit"
  end
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(title: params[:title], content: params[:content])
    redirect to "/recipes/#{params[:id]}"
  end

  #delete
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
  end

end
