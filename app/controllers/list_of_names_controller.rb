class ListOfNamesController < ApplicationController
  before_action :set_name, only: %i[show]

  def index
    @name_list = Name.where(initial: params[:initial])
  end

  def show
    @message =
      if already_attendance_today?
        "#{@name.name}さん、出席済みです"
      else
        create_attendance_for_today

        "#{@name.name}さん、出席しました"
      end
  end

  private

  def set_name
    @name = Name.find_by(id: params[:id])
  end

  def already_attendance_today?
    Attendance.find_by(name_id: @name.id)
  end

  def create_attendance_for_today
    attendance = Attendance.new

    attendance.assign_attributes(
      name_id: @name.id,
      attendance_date: Date.today
    )

    attendance.save!
  end
end
