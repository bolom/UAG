class CreateUniversites < ActiveRecord::Migration
  def self.up
    create_table :universites do |t|
      t.column :name, :string
      t.column :students, :string
      t.column :definition, :text
      t.column :remarque, :text
      t.column :content_type, :string
      t.column :filename, :string    
      t.column :thumbnail, :string 
      t.column :size, :integer
      t.column :width, :integer
      t.column :height, :integer
      t.column :link, :string
    end
  end

  def self.down
    drop_table :universites
  end
end
