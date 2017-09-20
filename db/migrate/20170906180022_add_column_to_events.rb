class AddColumnToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :sport, :string, null: false
    add_column :events, :user_id, :integer, null: false
  end
end
