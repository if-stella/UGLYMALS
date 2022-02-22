class AnimalsController < ApplicationController

  before_action :set_animal, only: %i[show]

  def index
    @animals = Animal.all
  end

  def show
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.create(animals_params)
    @animal.user = current_user
    @animal.save
    redirect_to animal_path(@animal)
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animals_params
    params.require(:animal).permit(:price, :photo, :name, :age, :species, :user_id)
  end
end
