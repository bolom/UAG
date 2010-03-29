class CreateMaillingLists < ActiveRecord::Migration
  def self.up
    create_table :mailling_lists do |t|
      t.column :label, :string
    end
  end

  def self.down
    drop_table :mailling_lists
  end
end
