class BookingsController < ApplicationController
  before_action :set_booking, only: [:show]
  def your_bookings
    @bookings = Booking.where(user: current_user)
  end

  def show
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.animal = @animal
    @booking.save!
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to your_bookings_path, notice: "Your booking has been cancelled"
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def bookings_params
    params.require(:booking).permit(:end_date, :start_date, :animal_id)
  end
end
