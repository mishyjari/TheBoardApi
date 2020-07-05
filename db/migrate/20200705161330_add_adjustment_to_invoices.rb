class AddAdjustmentToInvoices < ActiveRecord::Migration[6.0]
  def change
    add_column :invoices, :adjustment, :integer, :default => 0
  end
end
