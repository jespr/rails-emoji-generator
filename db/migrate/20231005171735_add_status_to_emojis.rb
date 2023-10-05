class AddStatusToEmojis < ActiveRecord::Migration[7.1]
  def change
    add_column :emojis, :status, :integer, default: 0
  end
end
