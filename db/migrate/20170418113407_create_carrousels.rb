class CreateCarrousels < ActiveRecord::Migration[5.0]
  def change
    create_table :carrousels do |t|

      t.timestamps
    end
  end
end
