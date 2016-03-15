class InternalLocationsController < ApplicationController
  before_action :set_internal_location, only: [:show, :edit, :update, :destroy]

  # GET /internal_locations
  # GET /internal_locations.json
  def index
    @internal_locations = InternalLocation.all
  end

  # GET /internal_locations/1
  # GET /internal_locations/1.json
  def show
  end

  # GET /internal_locations/new
  def new
    @internal_location = InternalLocation.new
  end

  # GET /internal_locations/1/edit
  def edit
  end

  # POST /internal_locations
  # POST /internal_locations.json
  def create
    @internal_location = InternalLocation.new(internal_location_params)

    respond_to do |format|
      if @internal_location.save
        format.html { redirect_to @internal_location, notice: 'Internal location was successfully created.' }
        format.json { render :show, status: :created, location: @internal_location }
      else
        format.html { render :new }
        format.json { render json: @internal_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /internal_locations/1
  # PATCH/PUT /internal_locations/1.json
  def update
    respond_to do |format|
      if @internal_location.update(internal_location_params)
        format.html { redirect_to @internal_location, notice: 'Internal location was successfully updated.' }
        format.json { render :show, status: :ok, location: @internal_location }
      else
        format.html { render :edit }
        format.json { render json: @internal_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_locations/1
  # DELETE /internal_locations/1.json
  def destroy
    @internal_location.destroy
    respond_to do |format|
      format.html { redirect_to internal_locations_url, notice: 'Internal location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_internal_location
      @internal_location = InternalLocation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def internal_location_params
      params.require(:internal_location).permit(:name, :activated)
    end
end
