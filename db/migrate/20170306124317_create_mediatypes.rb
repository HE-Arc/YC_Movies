class CreateMediatypes < ActiveRecord::Migration[5.0]
  def change
    create_table :mediatypes do |t|
      t.string :name

      t.timestamps
    end
  end
end
