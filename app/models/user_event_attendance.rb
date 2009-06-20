class UserEventAttendance < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  SURE_STATUS = 'sure'
  MAYBE_STATUS = 'maybe'

  named_scope :sure, :conditions => ["status = ?", SURE_STATUS]
  named_scope :maybe, :conditions => ["status = ?", MAYBE_STATUS]
end
