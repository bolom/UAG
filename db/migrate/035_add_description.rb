class AddDescription < ActiveRecord::Migration
  def self.up
    add_column :documents, :description, :string
    add_column :documents, :description_en, :string
  end

  def self.down
    remove_column :documents, :description
    remove_column :documents, :description_en
  end
end
