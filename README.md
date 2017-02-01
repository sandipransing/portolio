# Sample App: Portfolio

This is just an example app to cover the various concepts in Rails.

1. Create new Project 

  rails new portfolio

2. Create Employee Scaffold

  rails g scaffold employee name:string birth_date:date years_of_experience:integer bio:text

3. Run Migrations

  rails db:migrate

4. Start Server

  rails s

5. Add new email field

  rails g migration add_email_to_employees email:string:index
  rails db:migrate


That's it. Keep adding more info here.

