class AddLabel < ActiveRecord::Migration
  def self.up
    add_column :groupe_documents, :label_en, :string, :default => "NULL"
  end

  def self.down
    remove_column :groupe_documents, :label_en
  end
end
