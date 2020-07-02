class Courier < ApplicationRecord
  has_many :tickets
  has_many :clients, through: :tickets

  validates :first_name, :last_name, presence: true
  validates :email, :phone, uniqueness: true

  def full_name
    (self.first_name + " " + self.last_name)
  end

  def incomplete_tickets
    ticket = self.tickets.includes(:courier)
    ticket.filter do |t|
      !t.is_complete
    end
  end

  def tickets_today
    today = DateTime.now()
      tickets = self.tickets.includes(:courier)
      tickets.filter do |t|
        (t.time_due > today.beginning_of_day && t.time_due < today.end_of_day ||
          t.time_ready > today.beginning_of_day && t.time_due < today.end_of_day ||
          t.created_at > today.beginning_of_day && t.time_due < today.end_of_day)
      end
  end


end
