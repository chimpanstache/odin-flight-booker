class FlightsController < ApplicationController
  before_action :set_flight, only: %i[ show edit update destroy ]

  # GET /flights or /flights.json
  def index
    @flights = all_flights_with_airports
    @departures = @flights.map { |fli| fli.departure }.uniq
    @arrivals = @flights.map { |fli| fli.arrival }.uniq
    times = @flights.map { |fli| fli.time.strftime("%Y/%m/%d") }.uniq.sort
    @dates = times.map { |time| [time, time] }

    @results = search_results if params[:departure_id].present?
  end

  # GET /flights/1 or /flights/1.json
  def show
  end

  # GET /flights/new
  def new
    @flight = Flight.new
  end

  # GET /flights/1/edit
  def edit
  end

  # POST /flights or /flights.json
  def create
    @flight = Flight.new(flight_params)

    respond_to do |format|
      if @flight.save
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully created." }
        format.json { render :show, status: :created, location: @flight }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flights/1 or /flights/1.json
  def update
    respond_to do |format|
      if @flight.update(flight_params)
        format.html { redirect_to flight_url(@flight), notice: "Flight was successfully updated." }
        format.json { render :show, status: :ok, location: @flight }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flight.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flights/1 or /flights/1.json
  def destroy
    @flight.destroy

    respond_to do |format|
      format.html { redirect_to flights_url, notice: "Flight was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def all_flights_with_airports
      Flight.includes(:departure, :arrival).all
    end

    def search_results
      Flight.research(flight_params[:departure_id],
      flight_params[:arrival_id], 
      flight_params[:date].to_datetime)
    end
    
    # Only allow a list of trusted parameters through.
    def flight_params
      params.permit(:departure_id, :arrival_id, :passengers, :date)
    end
end
