class AddStreet2Citizens < ActiveRecord::Migration
  def self.up
    add_column :citizens, :street_2, :string
  end

  def self.down
    remove_column :citizens, :street_2
  end
end
