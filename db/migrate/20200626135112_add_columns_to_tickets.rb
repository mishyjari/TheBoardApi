class AddColumnsToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :pod, :string
    add_column :tickets, :time_delivered, :datetime
    add_column :tickets, :is_roundtrip, :boolean
    add_column :tickets, :roundtrip_details, :string
    add_column :tickets, :roundtrip_charge, :string
    add_column :tickets, :return_pod, :string
  end
end
