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
setup do
    @valid_params = {
      name: 'MyString',
      company: 'Some company',
      email: 'abc@gmail.com',
      salutation: :mr,
      years_of_experience: 12,
      eula: true,
    }

    @invalid_params = {
      name: 'MyString',
      company: 'Some company',
      email: 'abc@gmail.com',
      eula: true,
    }
  end

  teardown do
  end

  test "should create record" do
    Employee.create!(@valid_params)
    assert_equal(3, Employee.count)
  end

  test "should not create record" do
    Employee.create(@invalid_params)
    assert_equal(2, Employee.count)
  end

  test 'should validate presence of email' do
    employee = Employee.new(@valid_params.merge!(email: ''))
    employee.save
    assert_equal(2, Employee.count)
    validate_presence(employee, :email)
  end

  test 'should validate presence of years of experience' do
    employee = Employee.new(@valid_params.merge!(years_of_experience: nil))
    employee.save
    assert_equal(["is not a number"], employee.errors[:years_of_experience])
  end

  test 'should validate numericality of years of experience' do
    employee = Employee.new(@valid_params.merge!(years_of_experience: 'a12'))
    employee.save
    assert_equal(["is not a number"], employee.errors[:years_of_experience])
    employee.years_of_experience = -12
    employee.save
    assert_equal(["must be greater than or equal to 1"], employee.errors[:years_of_experience])
  end

  test 'should validate uniqueness of email' do
    employee = Employee.new(@valid_params.merge!(email: 'mystring1@gmail.com'))
    employee.save
    assert_equal(2, Employee.count)
    assert_equal(["is already present"], employee.errors[:email])
  end

  private

  def validate_presence(record, attribute)
    assert_equal(["can't be blank"], record.errors[attribute])
  end
end
