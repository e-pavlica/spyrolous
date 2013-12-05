require 'spec_helper'

describe Canvas do
  it "has a valid factory" do
    @canvas = FactoryGirl.create(:canvas)
    expect(@canvas).to be_valid
  end
end
