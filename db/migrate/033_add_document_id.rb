class AddDocumentId < ActiveRecord::Migration
  def self.up
    add_column :enseignements, :groupe_document_id, :integer
  end

  def self.down
    remove_column :enseignements, :groupe_document_id
  end
end
