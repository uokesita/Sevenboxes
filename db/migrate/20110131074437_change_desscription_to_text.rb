class ChangeDesscriptionToText < ActiveRecord::Migration
  def self.up
    change_column :events, :description, :text
    change_column :events, :link, :text
    change_column :events, :title, :text
  end

  def self.down
  end
end
