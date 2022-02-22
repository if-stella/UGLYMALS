class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @user = current_user
    @my_animals = Animal.where(user: @user)
    @my_bookings = Booking.where(user: @user)
  end
end
