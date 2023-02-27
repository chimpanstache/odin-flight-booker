class BookingsController < ApplicationController
  before_action :set_information, only: %i[show edit update destroy]

  # GET /information or /information.json
  def index; end

  # GET /information/1 or /information/1.json
  def show

  end

  # GET /information/new
  def new
    @flight = Flight.includes(:arrival, :departure).find(flight_params[:flight_id])
    @booking = Booking.new
    flight_params[:passengers].to_i.times { @booking.passengers.build }
  end

  # GET /information/1/edit
  def edit; end

  # POST /information or /information.json
  def create
    @booking = Booking.new(passenger_params)
    
    if @booking.save
      redirect_to show
    else
      render 'new'
    end
  end

  # PATCH/PUT /information/1 or /information/1.json
  def update
    respond_to do |format|
      if @information.update(information_params)
        format.html { redirect_to information_url(@information), notice: 'Information was successfully updated.' }
        format.json { render :show, status: :ok, location: @information }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @information.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /information/1 or /information/1.json
  def destroy
    @information.destroy

    respond_to do |format|
      format.html { redirect_to information_index_url, notice: 'Information was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def passenger_params
    params.require(:booking).permit(passengers_attributes: %i[email name])
  end

  # Only allow a list of trusted parameters through.
  def flight_params
    params.permit(:flight_id, :passengers)
  end
end
