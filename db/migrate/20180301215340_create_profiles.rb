class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.integer :no_of_workex_years
      t.string :current_company
      t.string :attachment
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
