class CreateCommit < ActiveRecord::Migration[5.0]
  def change
    create_table :commits do |t|
      t.integer :user_id, null: false
      t.integer :event_id, null: false

      t.timestamps null: false
    end
  end
end
