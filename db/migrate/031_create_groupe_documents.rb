class CreateGroupeDocuments < ActiveRecord::Migration
  def self.up
    create_table :groupe_documents do |t|
      t.column :label, :string
    end
  end

  def self.down
    drop_table :groupe_documents
  end
end
