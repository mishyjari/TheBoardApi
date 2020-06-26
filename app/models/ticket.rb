class Ticket < ApplicationRecord
  belongs_to :courier, optional: true
  belongs_to :client, optional: true
end
