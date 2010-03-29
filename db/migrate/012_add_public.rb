class AddPublic < ActiveRecord::Migration
  def self.up
    add_column "users", "is_admin", :boolean
    add_column "users", "user_id", :integer
  end

  def self.down
    remove_column "users", "is_admin"
    remove_column "users", "user_id"
  end
end
