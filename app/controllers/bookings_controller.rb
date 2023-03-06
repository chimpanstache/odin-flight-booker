class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @flight = Flight.includes(:arrival, :departure).find(flight_params[:flight_id])
    @booking = Booking.new
    flight_params[:passengers].to_i.times { @booking.passengers.build }
  end

  def create
    @booking = Booking.new(passenger_params)

    if @booking.save
      redirect_to @booking
    else
      render 'new'
    end
  end

  private

  def passenger_params
    params.require(:booking).permit(:flight_id, passengers_attributes: %i[email name])
  end

  # Only allow a list of trusted parameters through.
  def flight_params
    params.permit(:flight_id, :passengers)
  end
end
