class CreateRegionStuff < ActiveRecord::Migration
  def self.up
    add_column :regions, :country_id, :integer
    add_column :regions, :name, :string
  end

  def self.down
    remove_column :regions, :country_id
    remove_column :regions, :name
  end
end
