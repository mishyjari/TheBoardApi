class Ticket < ApplicationRecord
  belongs_to :courier, optional: true
  belongs_to :client, optional: true

  def total_charge
    self.base_charge.to_i + self.rush_charge.to_i + self.oversize_charge.to_i + self.roundtrip_charge.to_i + self.additional_charge.to_i
  end
end
