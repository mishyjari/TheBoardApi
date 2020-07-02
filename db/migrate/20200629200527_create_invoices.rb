class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.integer :client_id
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :paid

      t.timestamps
    end
  end
end
