class AddMoreFieldsToEmlpoyees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :salutation, :integer
    add_column :employees, :gender, :integer
  end
end
