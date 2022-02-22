class AnimalsController < ApplicationController
  before_action :set_animal, only: %i[show]
  def index
    @animals = Animal.all
  end

  def show
  end

  def new
  end

  def create
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animals_params
    params.require(:animals).permit(:price, :name, :age, :species, :user_id)
  end
end
