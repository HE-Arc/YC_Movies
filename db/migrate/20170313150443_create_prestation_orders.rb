class CreatePrestationOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :prestation_orders do |t|
      t.string :name
      t.string :firstname
      t.string :entreprise
      t.string :email
      t.string :tel
      t.text :place
      t.text :availabilities
      t.string :typeofproduct
      t.text :product
      t.time :length
      t.string :interview
      t.string :month
      t.integer :day
      t.text :other

      t.timestamps
    end
  end
end
