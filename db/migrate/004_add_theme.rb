class AddTheme < ActiveRecord::Migration
  def self.up
    add_column "enseignements", "contenu", :text
    add_column "enseignements", "type", :string
  end

  def self.down
  
    remove_column "enseignements", "contenu"
    remove_column "enseignements", "type"
  end
end
