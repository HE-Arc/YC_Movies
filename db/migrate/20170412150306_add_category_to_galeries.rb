class AddCategoryToGaleries < ActiveRecord::Migration[5.0]
  def change
    add_reference :galeries, :category, foreign_key: true
  end
end
