class CreateJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :jobs do |t|
      t.string :position
      t.string :job_description
      t.string :employment_type
      t.string :responsibilities
      t.string :requirements
      t.references :company, foreign_key: true
      t.references :user, foreign_key:true

      t.timestamps
    end
  end
end
