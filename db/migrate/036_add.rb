class Add < ActiveRecord::Migration
  def self.up
    add_column :enseignements, :last_udptated, :string
  end

  def self.down
    remove_column :enseignements, :last_udptated
  end
end
