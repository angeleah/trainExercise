require 'spec_helper'
require 'models/train'

describe Train do

  let(:train) {  Train.create!(
      line: "El",
      route: "BrownLine",
      run_number: "E102",
      operator: "SJones"
    )
  }

  it "has a line" do
    expect(train.line).to eq("El")
  end

  it "has a route" do
    expect(train.route).to eq("BrownLine")
  end
  it "has a run_number" do
    expect(train.run_number).to eq("E102")
  end
  it "has an operator" do
    expect(train.operator).to eq("SJones")
  end
end
