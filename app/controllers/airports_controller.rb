class AirportsController < ApplicationController
  before_action :set_airport, only: %i[ show edit update destroy ]

  # GET /airports or /airports.json
  def index
    @airports = Airport.all
  end

  def new
    @airport = Airport.new
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_airport
      @airport = Airport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def airport_params
      params.require(:airport).permit(:country, :city, :name)
    end
end
