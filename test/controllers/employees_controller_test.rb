require 'test_helper'

class EmployeesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employee = employees(:one)
  end

  test "should get index" do
    get employees_url
    assert_response :success
  end

  test "should get new" do
    get new_employee_url
    assert_response :success
  end

  test "should create employee" do
    assert_difference('Employee.count') do
      post employees_url, params: { employee: { bio: @employee.bio, 
        birth_date: @employee.birth_date, 
        name: @employee.name, years_of_experience: @employee.years_of_experience, 
        email: 'test@gmail.com', 
        salutation: @employee.salutation } }
    end

    assert_redirected_to employee_url(Employee.last)
    assert_equal 'Employee was successfully created.', flash[:notice]
  end

  test "should show employee" do
    get employee_url(@employee)
    assert_response :success
  end

  test "should get edit" do
    get edit_employee_url(@employee)
    assert_response :success
  end

  test "should update employee" do
    patch employee_url(@employee), params: { employee: { bio: @employee.bio, birth_date: @employee.birth_date, 
      name: @employee.name, years_of_experience: @employee.years_of_experience } }
    assert_redirected_to employee_url(@employee)
  end

  test "should destroy employee" do
    assert_difference('Employee.count', -1) do
      delete employee_url(@employee)
    end

    assert_redirected_to employees_url
  end

  test "should not create employee with same email" do
    count1 = Employee.count
    post employees_url, params: { employee: { bio: @employee.bio, birth_date: @employee.birth_date, 
        name: @employee.name, years_of_experience: @employee.years_of_experience, email: @employee.email, 
        salutation: @employee.salutation } }
    count2 = Employee.count
    assert_equal count1, count2     
  end

  test "should not create employee without email" do
    count1 = Employee.count
    post employees_url, params: { employee: { bio: @employee.bio, birth_date: @employee.birth_date, 
        name: @employee.name, years_of_experience: @employee.years_of_experience, 
        salutation: @employee.salutation } }
    count2 = Employee.count
    assert_equal count1, count2     
  end

  test "should not create employee without salutation" do
    count1 = Employee.count
    post employees_url, params: { employee: { bio: @employee.bio, birth_date: @employee.birth_date, 
        name: @employee.name, years_of_experience: @employee.years_of_experience, email: 'test1@gmail.com'} }
    count2 = Employee.count
    assert_equal count1, count2     
  end
end
