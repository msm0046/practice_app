class AttendanceConfirmationController < ApplicationController
  def daily
    # TODO: 日付指定に対応する
    # TODO: 日付指定がない場合に、今日の日付でページ表示する
    # NOTE: いまは「今日の日付の出席・未出席」の振り分けのみが実装済み
    # URL で /:year/:month/:day と指定された場合
    # params[:year], params[:month], params[:day] のように値が取得できる

    # Date, DateTime など Ruby の標準クラスがある
    target_date = Date.parse("#{params[:year]}-#{params[:month]}-#{params[:day]}")

    @year = params[:year]
    @month = params[:month]
    @day = params[:day]
    # @result = Attendance.find_by(attendance_date: target_date) # 仮表示用

    # Nameテーブルから全てのレコードを取得する
    name_list = Name.all

    @alreday_attendant = [] # 出席済み
    @not_attendant_yet = [] # 未出席

    # Name.all は Array と同じように扱える
    # .each メソッドでループ処理をすると、レコード一つだけに対する処理ができる
    name_list.each do |name| # name は一つ分の Name インスタンス (= レコード) が代入される
      # Attendanceテーブルのidとname_list.idが一致するものがあるか検索する
      #
      # Name レコードから、関連付けを用いて Attendance レコードを持ってくる

      # 指定した日付 (target_date) と一致するものがあるか、探したい
      if alreday_attendant?(name.attendances, target_date)
        # 出席済みの場合
        @alreday_attendant.push(name.name) # push で値を入れてあげる
      else
        # 未出席の場合
        @not_attendant_yet.push(name.name)
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

  private

  def alreday_attendant?(attendance_list, target_date)
    attendance_list.each do |attendance|
      # 出席済みの場合
      return true if attendance.attendance_date == target_date
    end

    false
  end
end
