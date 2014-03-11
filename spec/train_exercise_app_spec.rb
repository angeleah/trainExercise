require 'spec_helper'
require 'train_exercise_app'
require 'rack/test'

set :environment, :test

describe "train_exercise_app" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it "displays all the data" do
    get '/'
    expect(last_response).to be_ok
    Train.all.each do |train|
      expect(last_response.body).to include(train.line)
      expect(last_response.body).to include(train.route)
      expect(last_response.body).to include(train.run_number)
      expect(last_response.body).to include(train.operator)
    end
  end
end
