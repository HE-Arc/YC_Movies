class CreateMedia < ActiveRecord::Migration[5.0]
  def change
    create_table :media do |t|
        t.string :name
        t.string :url
        t.text :description
        t.timestamps
    end
    add_index :media,:url
  end
end
