Rails.application.routes.draw do
  # get 'admin/attendance_confirmation', to: 'attendance_confirmation#index'
  # get 'admin/attendance_confirmation/index', to: 'attendance_confirmation#index'
  get 'admin/attendance_confirmation/daily/:year/:month/:day', to: 'attendance_confirmation#daily'
  # TODO: 「毎月」の出欠表示を追加する
  get 'admin/attendance_confirmation/monthly/:year/:month', to: 'attendance_confirmation#monthly'
  get 'list_of_names/index'
  get 'list_of_names/show'
  # get '/'
  get 'fifty_character_table/index'
  root 'fifty_character_table#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
