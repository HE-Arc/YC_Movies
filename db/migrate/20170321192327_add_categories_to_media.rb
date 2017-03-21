class AddCategoriesToMedia < ActiveRecord::Migration[5.0]
  def change
    add_reference :media, :categories, foreign_key: true
  end
end
