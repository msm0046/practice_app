class ListOfNamesController < ApplicationController
  def index
    @name_list = Name.where(initial: params[:initial])
  end

  def show
    # Namesテーブルからparams[:id]と合致するidを検索し、その結果を@name変数に代入する
    @name = Name.find_by(id: params[:id])
    # Attendancesテーブルから@name.idと合致するidを検索し、その結果をattendance変数に代入する
    attendance = Attendance.find_by(name_id: @name.id)
    # もし、合致するidがあれば、
    if attendance
      # Attendancesテーブルのname_idカラムに@name.idの値をいれる
      attendance.name_id = @name.id
      # また、Date.todayの値をAttendancesテーブルのattendanceカラムにいれる
      attendance.attendance_date = Date.today
      # attendance変数の値を保存する
      attendance.save
      # "○○さん、出席しました"と表示する
      @message = "#{@name.name}さん、出席しました"
    # 合致したidがなければ、
    else
      # "○○さん、出席済みです"と表示する
      @message = "#{@name.name}さん、出席済みです"
    end
  end
end
