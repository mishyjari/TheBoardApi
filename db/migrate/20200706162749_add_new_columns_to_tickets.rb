class AddNewColumnsToTickets < ActiveRecord::Migration[6.0]
  def change
    add_column :tickets, :pickup_contact, :string
    add_column :tickets, :pickup_details, :string
    add_column :tickets, :dropoff_contact, :string
    add_column :tickets, :dropoff_details, :string
  end
end
