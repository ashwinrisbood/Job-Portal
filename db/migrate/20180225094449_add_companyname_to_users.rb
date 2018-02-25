class AddCompanynameToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :companyname, :string
  end
end
