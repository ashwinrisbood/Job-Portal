class AddIsRecruiterToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :isRecruiter, :boolean
  end
end
