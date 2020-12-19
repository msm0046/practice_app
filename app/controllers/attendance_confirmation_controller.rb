class AttendanceConfirmationController < ApplicationController
  def index
    # Nameテーブルから全てのレコードを取得する
    name_list = Name.all
    # Name.all は Array と同じように扱える
    # .each メソッドでループ処理をすると、レコード一つだけに対する処理ができる

    @alreday_attendant = [] # 出席済み
    @not_attendant_yet = [] # 未出席
    name_list.each do |name| # name は一つ分の Name インスタンス (= レコード) が代入される
      # Attendanceテーブルのidとname_list.idが一致するものがあるか検索する
      #
      # Name レコードから、関連付けを用いて Attendance レコードを持ってくる
      attendance_list = name.attendances

      # 今日の日付と一致するものがあるか、探したい
      attendance_list.each do |attendance|
        if attendance.attendance_date == Date.today
          # 出席済みの場合
          @alreday_attendant.push(name.name) # push で値を入れてあげる
        else
          # 未出席の場合
          @not_attendant_yet.push(name.name)
        end
      end
      # 配列として扱う: attendance_list.each do...
      # Attendance レコードの最新の日付が、今日と一致すれば、「出席済み」
      # 一致しなければ、「未出席」として扱える
      # NOTE: Attendance レコードは、複数返ってくることに注意 (= 配列)
      # イメージ: attendance_dates = name.attendances
      # Attendanceテーブルのattendance_dateに値が入っていたら、出席済みの方にグループ分けする
      # 値が入っていなければ、未出席の方にグループ分けする
    end
  end
end


def alreday_attendant?(attendance)
  
end