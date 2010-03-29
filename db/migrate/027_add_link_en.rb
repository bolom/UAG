class AddLinkEn < ActiveRecord::Migration
  def self.up
    add_column :universites, :link_en, :string
  end

  def self.down
    remove_column :universites, :link_en
  end
end
