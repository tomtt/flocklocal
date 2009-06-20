class Event < ActiveRecord::Base
  belongs_to :owner
  belongs_to :location
end
