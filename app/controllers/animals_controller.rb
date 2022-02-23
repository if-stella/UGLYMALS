class AnimalsController < ApplicationController

  before_action :set_animal, only: %i[show your_animal destroy]

  def index
    @animals = policy_scope(Animal).all
  end

  def your_animal
  end

  def show
  end

  def new
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.create(animals_params)
    @animal.user = current_user
    authorize @animal
    @animal.save
    redirect_to animal_path(@animal)
  end

  def destroy
    @animal.destroy
    redirect_to dashboard_path, notice: "Your animal has been deleted"
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
    authorize @animal
  end

  def animals_params
    params.require(:animal).permit(:price, :photo, :name, :age, :species, :user_id)
  end
end
