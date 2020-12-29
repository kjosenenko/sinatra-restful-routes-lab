class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # base url
  get '/' do
    redirect to "/recipes"
  end

  # index all recipes
  get '/recipes' do
    erb :index
  end

  # new recipe form
  get '/recipes/new' do
    erb :new
  end

  # create a new recipe
  post '/recipes' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

  # show a recipe
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :show
  end

  # edit a recipe form
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end

  # edit a recipe form
  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe = params
    @recipe.save
    redirect to "/recipes/#{@recipe.id}"
  end

  # delete a recipe
  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to "/recipes"
  end

end
