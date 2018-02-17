class AddIsAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :isAdmin, :bool
  end
end
