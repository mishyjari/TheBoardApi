class CreateTickets < ActiveRecord::Migration[6.0]
  def change
    create_table :tickets do |t|
      t.string :pickup
      t.string :dropoff
      t.datetime :time_ready
      t.datetime :time_due
      t.boolean :is_rush
      t.string :rush_details
      t.integer :rush_charge
      t.boolean :is_oversize
      t.string :oversize_details
      t.integer :oversize_charge
      t.text :notes
      t.integer :additional_charge
      t.integer :base_charge
      t.integer :courier_id
      t.integer :client_id
      t.boolean :is_complete
      t.timestamps
    end
  end
end
