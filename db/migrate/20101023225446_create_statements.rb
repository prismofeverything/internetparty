class CreateStatements < ActiveRecord::Migration
  def self.up
    create_table :statements do |t|
      t.text :body
      t.string :target_type
      t.integer :target_id

      t.timestamps
    end
  end

  def self.down
    drop_table :statements
  end
end
