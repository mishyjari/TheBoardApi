class Client < ApplicationRecord
  has_many :tickets
  has_many :couriers, through: :tickets
end
