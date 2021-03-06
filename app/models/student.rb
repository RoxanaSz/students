class Student < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :addresses, as: :addressable
  has_many :students_courses
  has_many :courses, through: :students_courses
  validates :password, presence: true, on: :create, confirmation: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true,
    uniqueness: { case_sensitive: false },
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ }

  accepts_nested_attributes_for :addresses

  def name
    "#{first_name} #{last_name}"
  end

end
