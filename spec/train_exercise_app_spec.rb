require 'spec_helper'
require 'train_exercise_app'
require 'rack/test'

set :environment, :test

describe "train_exercise_app" do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  before do
    Train.destroy_all
  end

  let(:train) { Train.find_or_create_by!(
    line: "El",
    route: "GreenLine",
    run_number: "E107",
    operator: "SJonesey"
    )
  }

  it "displays all the available train data" do
    train
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include(train.line)
    expect(last_response.body).to include(train.route)
    expect(last_response.body).to include(train.run_number)
    expect(last_response.body).to include(train.operator)
  end

  it "dispays the selected train data to be edited" do
    get "/edit/#{train.id}"
    expect(last_response.body).to include(train.line)
    expect(last_response.body).to include(train.route)
    expect(last_response.body).to include(train.run_number)
    expect(last_response.body).to include(train.operator)
  end

  it "allows users to upload CSV files" do
    file = Rack::Test::UploadedFile.new("spec/fixtures/upload_data.csv", content_type = "text/plain", binary = false)
    expect  {
      post "/import", myfile: file
    }.to change{ Train.count }.by(3)
  end

  describe "CRUD" do

    it "destroys the train by id" do
      train
      expect {
        post "/destroy", id: train.id
      }.to change{ Train.count }.by(-1)
    end

    it "creates a single record of train data" do
      expect{
        post "/create", line: "El", route: "GreenLine", run_number: "E107", operator: "SJonesey"
      }.to change{ Train.count }.by(1)
    end

    it "updates an existing record of train data" do
      train
      post "/update", id: train.id, line: "Metra", route: "GreenLine", run_number: "E107", operator: "SJonesey"
      train.reload
      expect(train.line).to eq("Metra")
    end
  end
end
