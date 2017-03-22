class CreateMedias < ActiveRecord::Migration[5.0]
  def change
    create_table :medias do |t|
      t.string :uid

      t.timestamps
    end
    add_index :medias, :uid
  end
end
