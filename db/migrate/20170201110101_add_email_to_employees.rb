class AddEmailToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :email, :string
    add_index :employees, :email
  end
end
