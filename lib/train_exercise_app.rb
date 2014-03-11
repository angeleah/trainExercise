$: << File.expand_path("../lib", File.dirname(__FILE__))

require 'sinatra'
require 'haml'
require 'db/schema'
require 'models/train'

get '/' do
  @schedule = Train.all.order(run_number: :asc)
  haml :index
end
