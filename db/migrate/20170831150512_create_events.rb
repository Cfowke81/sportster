class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description
      t.string :address, null: false
      t.string :city, null: false
      t.string :zip, null: false
      t.string :loc, null: false

      t.timestamps null: false
    end
  end
end
