class AddEnseignant < ActiveRecord::Migration
  def self.up
    add_column :users, :enseignant_id, :integer
  end

  def self.down
    remove_column :users, :enseignant_id
  end
end
