class AddPredictionIdToEmojis < ActiveRecord::Migration[7.1]
  def change
    add_column :emojis, :prediction_id, :string
    add_index :emojis, :prediction_id
  end
end
