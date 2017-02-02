class Employee < ApplicationRecord

  enum salutation: { mr: 1, mrs: 2, mstr: 3 }
  enum gender: { male: 1, female: 2}

  validates :name, presence: true
  validates :email,
    presence: true,
    uniqueness: {
      case_sensitive: true,
      message: 'is already present',
      allow_blank: true
    }
  validates :salutation, inclusion: { in: salutations.keys }
  validates :years_of_experience, numericality: { greater_than_or_equal_to: 1 }

  validates :eula, acceptance: true


  def f_saluation
    salutation || self.class.salutations.keys.first
  end

  def f_name
    [f_saluation, name].join(' ')
  end

  def f_gender
    gender? ? 'Male' : 'Female'
  end

end
