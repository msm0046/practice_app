class ListOfNamesController < ApplicationController
  def index
    @name_list = Name.where(initial: params[:initial])
  end
end
