class AnimalsController < ApplicationController

  def index
  end

  def show
  end

  def new
  end

  def create
  end

private

  def animal_params
    params.require(:animal).permit(:title, :body, :photo)
  end
end
