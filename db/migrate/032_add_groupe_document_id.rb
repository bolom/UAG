class AddGroupeDocumentId < ActiveRecord::Migration
  def self.up
    remove_column :documents, :user_id
    add_column :documents, :groupe_document_id , :integer, :default => 0
  end

  def self.down
    add_column :documents, :user_id,      :integer, :default => 0
    remove_column :documents, :groupe_document_id 
  end
end
