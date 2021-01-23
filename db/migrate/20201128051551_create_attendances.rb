class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.date :attendance_date

      t.timestamps
    end
  end
end
