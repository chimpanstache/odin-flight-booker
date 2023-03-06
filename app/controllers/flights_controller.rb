class FlightsController < ApplicationController
  before_action :set_flight, only: %i[show edit update destroy]

  # GET /flights or /flights.json
  def index
    @flights = all_flights_with_airports
    @departures = @flights.map { |fli| fli.departure }.uniq
    @arrivals = @flights.map { |fli| fli.arrival }.uniq
    times = @flights.map { |fli| fli.time.strftime('%Y/%m/%d') }.uniq.sort
    @dates = times.map { |time| [time, time] }

    @results = search_results if params[:departure_id].present?
  end

  private

  def all_flights_with_airports
    Flight.includes(:departure, :arrival).all
  end

  def search_results
    Flight.research(flight_params[:departure_id],
                    flight_params[:arrival_id],
                    flight_params[:date].to_datetime)
  end

  def flight_params
    params.permit(:departure_id, :arrival_id, :passengers, :date)
  end
end
