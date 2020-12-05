class ListOfNamesController < ApplicationController
  def index
    @name_list = Name.where(initial: params[:initial])
  end

  def show
    @name = Name.find_by(id: params[:id])
    # Attendanceテーブルから@name.idと合致するidを検索する
    # Attendanceテーブルに合致するidがあれば、Attendanceテーブルのnames_idカラムにnameのidを挿入する
    attendance = Attendance.find_by(names_id: @name.id)
    if attendance
      attendance.names_id = @name.id
      # names_idカラムに値が入ったら、Attendanceテーブルのattendance_dateカラムに今日の日付を挿入する
      attendance.attendance_date = Date.today
      attendance.save
      @message = "#{@name.name}さん、出席しました"
    else
      # Attendanceテーブルに合致するidがなければ、nilを返す
      # "出席済み"の表示を代入する
      @message = "#{@name.name}さん、出席済みです"
    end
  end
end
