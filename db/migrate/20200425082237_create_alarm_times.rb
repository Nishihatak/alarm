class CreateAlarmTimes < ActiveRecord::Migration[5.2]
  def change
    create_table :alarm_times do |t|
      t.references :user, foreign_key: true, null: false
      t.time :time
      t.timestamps
    end
  end
end
