require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Location do
  before(:each) do
    @valid_attributes = {
      :address => "value for address",
      :lat => 1.5,
      :lng => 1.5,
      :description => "value for description"
    }
  end

  it "should create a new instance given valid attributes" do
    Location.create!(@valid_attributes)
  end
end
