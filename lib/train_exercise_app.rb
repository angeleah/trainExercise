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
