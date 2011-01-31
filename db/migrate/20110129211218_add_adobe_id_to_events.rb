class AddAdobeIdToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :adobe_id, :int
  end

  def self.down
    remove_column :events, :adobe_id
  end
end
