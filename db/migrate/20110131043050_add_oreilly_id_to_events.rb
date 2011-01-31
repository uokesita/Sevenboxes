class AddOreillyIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :oreilly_id, :int
  end

  def self.down
    remove_column :events, :oreilly_id
  end
end
