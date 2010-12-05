class CreateCounties < ActiveRecord::Migration
  def self.up
    create_table :counties do |t|
      t.string :name
      t.integer :region_id
      t.timestamps
    end
  end

  def self.down
    drop_table :counties
  end
end
