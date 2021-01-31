require 'rails_helper'

def create_attendance_history
  Timecop.freeze(2021, 1, 1)

  Attendance.create(
    name_id: name_id,
    attendance_date: Date.today
  )

  Timecop.return
end

RSpec.feature "ListOfNames", type: :feature do
  # HINT: テスト環境へのデータ投入は次のコマンドで実施: rails db:seed RAILS_ENV=test
  let(:name_id) { Name.first.id } # db/seeds.rb で投入されるデータの適当な ID 値を指定

  describe '1日の出席操作1回目は' do
    before do
      create_attendance_history # 2021/1/1 の出席データを作成

      Timecop.freeze(2021, 1, 2)
    end

    # FIXME: テストが落ちるので、実装コードを修正する
    it '「〇〇さん、出席しました」と表示される' do
      visit list_of_names_show_path(id: name_id)

      expect(page.body).to match '出席しました'
    end

    after do
      Timecop.return
      Attendance.destroy_all
    end
  end

  describe '1日の出席操作2回目は' do

    before do
      Timecop.freeze(2021, 1, 1)

      Attendance.create(
        name_id: name_id,
        attendance_date: Date.today
      )
    end

    it '「〇〇さん、出席済みです」と表示される' do
      visit list_of_names_show_path(id: name_id)

      expect(page.body).to match '出席済みです'
    end

    after do
      Timecop.return
      Attendance.destroy_all
    end
  end
end
