$: << File.expand_path("../lib", File.dirname(__FILE__))

require 'sinatra'
require 'haml'
require 'db/schema'
require 'models/train'
require 'file_importer'

get '/' do
  @schedule = Train.all.order(run_number: :asc)
  haml :index
end

post '/import' do
  file_data = params[:myfile][:tempfile]
  FileImporter.new(file_data).import
  redirect '/'
end

post '/create' do
  Train.find_or_create_by!(train_params)
  redirect '/'
end

post '/destroy' do
  train = Train.find(params[:id])
  train.destroy if train
  redirect '/'
end

get '/edit/:id' do
  @train = Train.find(params[:id])
  haml :edit
end

post '/update' do
  train = Train.find(params[:id])
  train.update_attributes(train_params)
  redirect '/'
end

def train_params
  {
    line: params[:line],
    route: params[:route],
    run_number: params[:run_number],
    operator: params[:operator]
  }
end
