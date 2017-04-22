class CreateCaptchas < ActiveRecord::Migration[5.0]
  def change
    create_table :captchas do |t|
      t.boolean :activate

      t.timestamps
    end
  end
end
