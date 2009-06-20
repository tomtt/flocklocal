class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :title
      t.string :excerpt
      t.text :description
      t.references :owner
      t.datetime :start_time
      t.datetime :end_time
      t.references :location

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
