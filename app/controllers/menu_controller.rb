class MenuController < ApplicationController
  def index
    return redirect_to menu_path(section: Section.first.name) unless params[:section]

    @sections = Section.all
    section = Section.find_by(name: params[:section])
    @food_items = section.food_items
  end
end