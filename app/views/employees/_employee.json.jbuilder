json.extract! employee, :id, :name, :birth_date, :years_of_experience, :bio, :created_at, :updated_at
json.url employee_url(employee, format: :json)