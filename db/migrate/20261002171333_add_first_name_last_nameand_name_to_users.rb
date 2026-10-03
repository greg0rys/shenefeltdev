class AddFirstNameLastNameandNameToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
    add_column :users, :name, :text
  end
end
