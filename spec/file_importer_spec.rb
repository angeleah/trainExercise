require 'spec_helper'
require 'file_importer'

describe FileImporter do

  let(:sample_data_1) { File.join( "spec", "fixtures", "sample_data_1.csv")}
  let(:sample_data_2) { File.join( "spec", "fixtures", "sample_data_2.csv")}
  let(:sample_data_3) { File.join( "spec", "fixtures", "sample_data_3.csv")}

  context "#import" do
    it "imports the data from a CSV" do
      expect {
        FileImporter.new(sample_data_1).import
      }.to change(Train, :count).by(6)
    end
  end
end
