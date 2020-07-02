class Invoice < ApplicationRecord
  belongs_to :client

  def tickets
    self.client.tickets.filter do |t|
      t.time_ready > self.start_date && t.time_ready < self.end_date
    end
  end

  def balance
    bal = 0
    self.tickets.each do |t|
      bal += t.base_charge
    end
    bal
  end
end
