class CreateRegions < ActiveRecord::Migration
  def self.up
    create_table :regions do |t|
    
      t.timestamps
    end
    remove_column :citizens, :region
    remove_column :citizens, :country
    add_column :citizens, :region_id, :integer
    add_column :citizens, :country_id, :integer
  end

  def self.down
    drop_table :regions
    add_column :citizens, :region, :string
    add_column :citizens, :country, :string
    remove_column :citizens, :region_id
    remove_column :citizens, :country_id
  end
end
