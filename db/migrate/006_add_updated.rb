class AddUpdated < ActiveRecord::Migration
  def self.up
    add_column :enseignements, :updated_at, :datetime
    add_column :enseignements, :modifier_par, :string
  end

  def self.down
    remove_column :enseignements, :updated_at
    remove_column :enseignements, :modifier_par
  end
end
