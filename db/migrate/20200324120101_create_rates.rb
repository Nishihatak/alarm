class CreateRates < ActiveRecord::Migration[5.2]
  def change
    create_table :rates do |t|
      t.references :user, foreign_key: true, null: false
      t.integer    :feel, null: false
      t.integer    :awake, null: false
      t.integer    :sleep, null: false
      t.integer    :tired, null: false
      t.integer    :body, null: false
      t.text     :memo
      t.timestamps
    end
  end
end
