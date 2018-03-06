class AddIsclosedToJobs < ActiveRecord::Migration[5.1]
  def change
    add_column :jobs, :isClosed, :boolean
  end
end
