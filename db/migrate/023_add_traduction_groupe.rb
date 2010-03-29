class AddTraductionGroupe < ActiveRecord::Migration
  def self.up
    add_column :groupes, :title_en, :string,  :default => "text1"
  end

  def self.down
    remove_column :groupes, :title_en
  end
end
