class CreateApplications < ActiveRecord::Migration[5.1]
  def change
    create_table :applications do |t|
      t.string :name
      t.string :current_company
      t.string :linkedin
      t.string :add_info
      t.string :gender
      t.string :race
      t.string :disability
      t.references :user, foreign_key: true
      t.references :job, foreign_key: true

      t.timestamps
    end
  end
end
