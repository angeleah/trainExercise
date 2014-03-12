require 'spec_helper'
require 'active_record'
require 'models/train'

describe Train do

  let!(:train) {
    Train.find_or_create_by!(
      line: "El",
      route: "GreenLine",
      run_number: "E107",
      operator: "SJonesey"
    )
  }

  after :all do
    train.destroy
  end

  it "has a line" do
    expect(train.line).to eq("El")
  end

  it "has a route" do
    expect(train.route).to eq("GreenLine")
  end
  it "has a run_number" do
    expect(train.run_number).to eq("E107")
  end

  it "has an operator" do
    expect(train.operator).to eq("SJonesey")
  end
end
