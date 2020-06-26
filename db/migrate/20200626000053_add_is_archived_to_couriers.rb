class AddIsArchivedToCouriers < ActiveRecord::Migration[6.0]
  def change
    add_column :couriers, :is_archived, :boolean
  end
end
