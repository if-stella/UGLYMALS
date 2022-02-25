class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :destroy]

  def index
    @bookings = policy_scope(Booking).where(user: current_user)
  end


  def show
  end

  def new
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @animal = Animal.find(params[:animal_id])
    @booking = Booking.new(bookings_params)
    @booking.user = current_user
    @booking.animal = @animal
    @booking.total_price = total_price(@booking, @animal)
    @booking.status = 1
    authorize @booking
    @booking.save!
    if @booking.save!
      redirect_to booking_path(@booking), notice: "Your booking is now pending, wait for #{@booking.animal.name}'s owner to confirm it."
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, notice: "Your booking has been cancelled"
  end

  private

  def total_price(booking, animal)
    days = booking.end_date - booking.start_date
    price_per_day = animal.price
    return (days * price_per_day).to_i
  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def bookings_params
    params.require(:booking).permit(:end_date, :start_date, :animal_id)
  end
end
