class CreateGaleries < ActiveRecord::Migration[5.0]
  def change
    create_table :galeries do |t|
      t.string :uid

      t.datetime :created_at
    end
    add_index :galeries, :uid
  end
end
