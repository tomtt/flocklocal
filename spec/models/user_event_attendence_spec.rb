require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserEventAttendence do
  before(:each) do
    @valid_attributes = {
      :event => ,
      :user => ,
      :status => "value for status"
    }
  end

  it "should create a new instance given valid attributes" do
    UserEventAttendence.create!(@valid_attributes)
  end
end
