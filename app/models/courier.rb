class Courier < ApplicationRecord
  has_many :tickets
  has_many :clients, through: :tickets

  validates :first_name, :last_name, presence: true
  validates :email, :phone, uniqueness: true

  def full_name
    (self.first_name + " " + self.last_name)
  end

end
