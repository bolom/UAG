class CreateContributions < ActiveRecord::Migration
  def self.up
    create_table :contributions do |t|
      t.column :enseignement_id, :number
      t.column :enseignant_id, :number
    end
  end

  def self.down
    drop_table :contributions
  end
end
