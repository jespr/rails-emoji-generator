class CreateEmojis < ActiveRecord::Migration[7.1]
  def change
    create_table :emojis do |t|
      t.string :prompt

      t.timestamps
    end
  end
end
