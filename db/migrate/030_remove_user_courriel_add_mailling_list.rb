class RemoveUserCourrielAddMaillingList < ActiveRecord::Migration
  def self.up
    remove_column :couriels, :user_id 
    add_column :couriels, :mailling_list_id, :integer
  end

  def self.down
    add_column :couriels, :user_id, :integer, :default => 0
    remove_column :couriels, :mailling_list_id
  end
end
