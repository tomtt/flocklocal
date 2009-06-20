class CreateUserEventAttendances < ActiveRecord::Migration
  def self.up
    create_table :user_event_attendances do |t|
      t.references :event
      t.references :user
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :user_event_attendances
  end
end
