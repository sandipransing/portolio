class Employee < ApplicationRecord

  validates :name, presence: true
  validates :email,
    presence: true,
    uniqueness: {
      case_sensitive: true,
      message: 'is already present',
      allow_blank: true
    }
  validates :years_of_experience, numericality: { greater_than_or_equal_to: 1 }
end
