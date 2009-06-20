class MoveLocationInfoIntoEvent < ActiveRecord::Migration
  def self.up
    add_column :events, :address, :string
    add_column :events, :lat, :float
    add_column :events, :lng, :float
    add_column :events, :location_description, :text
    drop_table :locations
  end

  def self.down
    create_table :locations do |t|
      t.string :address
      t.float :lat
      t.float :lng
      t.text :description

      t.timestamps
    end
    remove_column :events, :description
    remove_column :events, :lng
    remove_column :events, :lat
    remove_column :events, :address
  end
end
