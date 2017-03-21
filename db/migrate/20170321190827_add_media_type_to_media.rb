class AddMediaTypeToMedia < ActiveRecord::Migration[5.0]
  def change
    add_reference :media, :mediatype, foreign_key: true
  end
end
