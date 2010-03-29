class AddCycles < ActiveRecord::Migration
  def self.up
    add_column :enseignements, :cycle, :string
  end

  def self.down
    remove_column :enseignements, :cycle
  end
end
