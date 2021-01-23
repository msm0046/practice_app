class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.string :name
      t.string :initial, limit: 1, null: false

      t.timestamps
    end
  end
end
