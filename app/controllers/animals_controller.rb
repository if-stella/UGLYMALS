class AnimalsController < ApplicationController

  before_action :set_animal, only: %i[show your_animal edit update destroy]
  skip_before_action :authenticate_user!, only: %i[show index]

  def index
    @animals = policy_scope(Animal).all
    @species = []
    @age = (0..10).to_a
    Animal.all.each do |animal|
      @species << animal.species
    end
    if params[:animal].present? && params[:animal][:species].present? && params[:animal][:age1].present? && params[:animal][:age2].present? && params[:animal][:name].present?
      specie = params[:animal][:species]
      age1 = params[:animal][:age1]
      age2 = params[:animal][:age2]
      name = params[:animal][:name]
      @animals = policy_scope(Animal).where(species: specie, age: age1..age2, name: name)
    elsif params[:animal].present? && params[:animal][:species].present? && params[:animal][:age1].present? && params[:animal][:age2].present?
      specie = params[:animal][:species]
      age1 = params[:animal][:age1]
      age2 = params[:animal][:age2]
      @animals = policy_scope(Animal).where(species: specie, age: age1..age2)
    elsif params[:animal].present? && params[:animal][:species].present?
      specie = params[:animal][:species]
      @animals = policy_scope(Animal).where(species: specie)
    elsif params[:animal].present? && params[:animal][:age1].present? && params[:animal][:age2].present? && params[:animal][:name].present?
      age1 = params[:animal][:age1]
      age2 = params[:animal][:age2]
      @animals = policy_scope(Animal).where(age: age1..age2, name: name)
    elsif params[:animal].present? && params[:animal][:age1].present? && params[:animal][:age2].present?
      age1 = params[:animal][:age1]
      age2 = params[:animal][:age2]
      @animals = policy_scope(Animal).where(age: age1..age2)
    elsif params[:animal].present? && params[:animal][:name].present?
      name = params[:animal][:name]
      @animals = policy_scope(Animal).where(name: name)
    else
      @animals = policy_scope(Animal).all
    end
  end

  def your_animal
  end

  def show
    @booking = Booking.new
  end

  def new
    @species = []
    Animal.all.each do |animal|
      @species << animal.species
    end
    @animal = Animal.new
    authorize @animal
  end

  def create
    @animal = Animal.create(animals_params)
    @animal.user = current_user
    authorize @animal
    @animal.save
    redirect_to animal_path(@animal), notice: "Your animal profile has been created"
  end

  def update
    if @animal.update(animals_params)
      flash[:notice] = 'Your animal profile was updated.'
      redirect_to animal_path(@animal)
    else
      render 'edit'
    end
  end

  def edit
  end

  def destroy
    @animal.destroy
    flash[:notice] = "Your animal profile has been deleted"
    redirect_to dashboard_path
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
