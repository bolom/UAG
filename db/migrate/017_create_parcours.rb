class CreateParcours < ActiveRecord::Migration
  def self.up
    create_table :parcours do |t|
      t.column :title, :string
    end
  end

  def self.down
    drop_table :parcours
  end
end
