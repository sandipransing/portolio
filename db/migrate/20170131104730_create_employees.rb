class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :company
      t.date :birth_date
      t.integer :years_of_experience
      t.text :bio

      t.timestamps
    end
  end
end
