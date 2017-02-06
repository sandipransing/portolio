require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase
	setup do
    @employee = employees(:one)
  end

  test "Save employee details" do
  	employee = Employee.new({ bio: @employee.bio, birth_date: @employee.birth_date, 
        name: @employee.name, years_of_experience: @employee.years_of_experience, email: "test@gmail.com", 
        salutation: @employee.salutation })
		employee.save
		assert_equal([], employee.errors.full_messages)
  end

  test "Unable to save employee without salutation" do
  	employee = Employee.new({ bio: @employee.bio, birth_date: @employee.birth_date, 
        name: @employee.name, years_of_experience: @employee.years_of_experience, email: "test@gmail.com"})
		employee.save
		assert_equal(["Salutation is not included in the list"], employee.errors.full_messages)
  end

  test "Unable to save employee without name" do
  	employee = Employee.new({ bio: @employee.bio, birth_date: @employee.birth_date, 
        years_of_experience: @employee.years_of_experience, email: "test@gmail.com", 
        salutation: @employee.salutation })
		employee.save
		assert_equal(["Name can't be blank"], employee.errors.full_messages)
  end

  test "Unable to save employee with zero years of experience" do
  	employee = Employee.new({ bio: @employee.bio, birth_date: @employee.birth_date, 
        years_of_experience: 0, email: "test@gmail.com", name: @employee.name,
        salutation: @employee.salutation })
		employee.save
		assert_equal(["Years of experience must be greater than or equal to 1"], employee.errors.full_messages)
  end

  test "Employee email should not be blank" do
  	employee = Employee.new({ bio: @employee.bio, birth_date: @employee.birth_date, 
        name: @employee.name, years_of_experience: @employee.years_of_experience, 
        salutation: @employee.salutation })
		employee.save
		assert_equal(["Email can't be blank"], employee.errors.full_messages)
  end

end
