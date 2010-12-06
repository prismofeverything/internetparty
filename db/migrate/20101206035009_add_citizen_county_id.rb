class AddCitizenCountyId < ActiveRecord::Migration
  def self.up
    add_column :citizens, :county_id, :integer
  end

  def self.down
    remove_column :citizens, :county_id
  end
end
