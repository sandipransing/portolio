class AddEulaToEmployees < ActiveRecord::Migration[5.0]
  def change
    add_column :employees, :eula, :boolean
    # For the existing values
    #
    Employee.all.each do |emp|
      emp.eula = true
      emp.save(validate: false) # bypass validations for eula
    end
  end
end
