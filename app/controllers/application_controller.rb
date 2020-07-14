class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end


  # Main Page
  get '/' do
    "Recipes Main Page Go to /recipes/new"
  end


  # Create a new recipe
  get '/recipes/new' do
    erb :new
  end


  # Read
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  # Read
  get '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    erb :show
  end

  # Create
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end

  # Edit
  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params[:id])
    erb :edit
  end

  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.update(name: params[:recipe][:name], ingredients: params[:recipe][:ingredients], cook_time: params[:recipe][:cook_time])
    redirect to "/recipes/#{params[:id]}"
  end


  #Delete
  delete '/recipes/:id' do
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect to '/recipes'
  end


end
