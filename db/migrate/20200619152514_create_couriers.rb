class CreateCouriers < ActiveRecord::Migration[6.0]
  def change
    create_table :couriers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :radio_number
      t.boolean :is_active 
      t.timestamps
    end
  end
end
