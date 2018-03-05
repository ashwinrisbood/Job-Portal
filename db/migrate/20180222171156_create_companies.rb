class CreateCompanies < ActiveRecord::Migration[5.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :website
      t.string :hq
      t.integer :size
      t.string :Founded
      t.string :industry
      t.integer :revenue
      t.string :synopsis

      t.timestamps
    end
  end
end
