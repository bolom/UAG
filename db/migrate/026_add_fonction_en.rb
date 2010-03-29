class AddFonctionEn < ActiveRecord::Migration
  def self.up
    add_column :enseignants, :fonction_en, :string
  end

  def self.down
    remove_column :enseignants, :fonction_en
  end
end
