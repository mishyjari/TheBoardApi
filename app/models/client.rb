class Client < ApplicationRecord
  has_many :tickets
  has_many :couriers, through: :tickets
  has_many :invoices

  def incomplete_tickets
    self.tickets.filter do |t|
      !t.is_complete
    end
  end

  def tickets_today
    today = DateTime.now()
      tickets = self.tickets
      tickets.filter do |t|
        (t.time_due > today.beginning_of_day && t.time_due < today.end_of_day ||
          t.time_ready > today.beginning_of_day && t.time_due < today.end_of_day ||
          t.created_at > today.beginning_of_day && t.time_due < today.end_of_day)
      end
  end

end
