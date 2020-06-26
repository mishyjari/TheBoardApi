class CreateClients < ActiveRecord::Migration[6.0]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :contact_person
      t.string :contact_phone
      t.string :address
      t.timestamps
    end
  end
end
