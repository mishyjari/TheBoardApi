class AddIsArchivedToClients < ActiveRecord::Migration[6.0]
  def change
    add_column :clients, :is_archived, :boolean
  end
end
