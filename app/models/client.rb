class Client < ApplicationRecord
  has_many :tickets
  has_many :couriers, through: :tickets
  has_many :invoices

  def incomplete_tickets
    self.tickets.filter do |t|
      !t.is_complete
    end
  end
end
