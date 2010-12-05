class CreateFirstLastNameCitizens < ActiveRecord::Migration
  def self.up
    remove_column :citizens, :name
    add_column :citizens, :first_name, :string
    add_column :citizens, :last_name, :string
  end

  def self.down
    add_column :citizens, :name
    remove_column :citizens, :first_name
    remove_column :citizens, :last_name
  end
end
