class AddIsRecruiterToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :isRecruiter, :bool
  end
end
