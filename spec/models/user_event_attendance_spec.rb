require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe UserEventAttendance do
  before(:each) do
    @valid_attributes = {
      :event => ,
      :user => ,
      :status => "value for status"
    }
  end

  it "should create a new instance given valid attributes" do
    UserEventAttendance.create!(@valid_attributes)
  end
end
