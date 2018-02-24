class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :description
      t.string :type
      t.string :responsibilities
      t.string :requirements
      t.timestamps
      add_foreign_key :jobs, :companies
    end
  end
end
