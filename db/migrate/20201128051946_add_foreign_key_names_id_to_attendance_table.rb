class AddForeignKeyNamesIdToAttendanceTable < ActiveRecord::Migration[6.0]
  def change
    # 第一引数：テーブル名、第二引数：参照対象テーブル名
    add_reference :attendances, :name, foreign_key: true
  end
end
