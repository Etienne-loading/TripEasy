class AddingColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :pseudo, :string
    add_column :users, :birthday, :date
    add_column :users, :nationality, :string
    add_column :users, :interest, :string
  end
end
