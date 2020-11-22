class ListOfNamesController < ApplicationController
  def index
    @name_list = Name.where(initial: params[:initial])
  end

  def show
    @name = Name.find_by(id: params[:id])
  end
end
