class CreateCandidates < ActiveRecord::Migration
  def self.up
    create_table :candidates do |t|
      t.integer :citizen_id
      t.integer :constituency_id

      t.timestamps
    end
  end

  def self.down
    drop_table :candidates
  end
end
