class AddFonction < ActiveRecord::Migration
  def self.up
    add_column :enseignants, :fonction, :string
  end

  def self.down
    remove_column :enseignants, :fonction
  end
end
