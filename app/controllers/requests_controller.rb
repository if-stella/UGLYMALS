class RequestsController < ApplicationController
  def index
    skip_authorization
    @requests = []
    policy_scope(Booking).all.each do |booking|
      if booking.animal.user == current_user
        @requests << booking
      end
    end
    @confirmed = []
    @pending = []
    @denied = []
    @requests.each do |r|
      if r.status == 2
        @confirmed << r
      elsif r.status == 1
        @pending << r
      else
        @denied << r
      end
    end
  end

  def edit
    @request = Booking.find(params[:id])
    authorize @request
  end

  def update
    @request = Booking.find(params[:id])
    skip_authorization

    if params[:status] == "2"
      @request.status = 2
      flash[:notice] = "You confirmed the booking for #{@request.user.email} with #{@request.animal.name}"
    else
      @request.status = 0
      flash[:notice] = "You denied the booking for #{@request.user.email} with #{@request.animal.name}"
    end
    @request.save!
    redirect_to requests_path
  end
end
