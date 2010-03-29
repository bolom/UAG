class CreateMailings < ActiveRecord::Migration
  def self.up
    create_table :couriels do |t|
      t.column :email, :string
      t.column :user_id, :integer
    end
  end

  def self.down
    drop_table :couriels
  end
end
