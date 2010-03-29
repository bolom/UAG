class AddPhoto < ActiveRecord::Migration
  def self.up
    add_column :enseignants, :parent_id, :integer
    add_column :enseignants, :content_type, :string
    add_column :enseignants, :filename, :string
    add_column :enseignants, :thumbnail, :string 
    add_column :enseignants, :size, :integer
    add_column :enseignants, :width, :integer
    add_column :enseignants, :height, :integer
  end

  def self.down
    remove_column :enseignants, :parent_id
    remove_column :enseignants, :content_type
    remove_column :enseignants, :filename
    remove_column :enseignants, :thumbnail
    remove_column :enseignants, :size
    remove_column :enseignants, :width
    remove_column :enseignants, :height
  end
end
