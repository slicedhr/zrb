class SubsidiariesController < ApplicationController
  before_action :set_subsidiary, only: [:show, :edit, :update, :destroy]

  # GET /subsidiaries
  # GET /subsidiaries.json
  def index
    @subsidiaries_grid = initialize_grid(
                      Subsidiary,
                      name: 'grid',
                      csv_field_separator: ';',
                      csv_file_name: 'subsidiaries',
                      per_page: 30
                  )

    
    export_grid_if_requested('grid' => 'grid')
  end

  # GET /subsidiaries/1
  # GET /subsidiaries/1.json
  def show
  end

  # GET /subsidiaries/new
  def new
    @subsidiary = Subsidiary.new
  end

  # GET /subsidiaries/1/edit
  def edit
  end

  # POST /subsidiaries
  # POST /subsidiaries.json
  def create
    @subsidiary = Subsidiary.new(subsidiary_params)

    respond_to do |format|
      if @subsidiary.save
        format.html { redirect_to subsidiaries_url, notice: 'Éxito al guardar.' }
        format.json { render :show, status: :created, location: @subsidiary }
      else
        format.html { render :new }
        format.json { render json: @subsidiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subsidiaries/1
  # PATCH/PUT /subsidiaries/1.json
  def update
    respond_to do |format|
      if @subsidiary.update(subsidiary_params)
        format.html { redirect_to subsidiaries_url, notice: 'Éxito al guardar.' }
        format.json { render :show, status: :ok, location: @subsidiary }
      else
        format.html { render :edit }
        format.json { render json: @subsidiary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subsidiaries/1
  # DELETE /subsidiaries/1.json
  def destroy
    @subsidiary.destroy
    respond_to do |format|
      format.html { redirect_to subsidiaries_url, notice: 'Item Eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subsidiary
      @subsidiary = Subsidiary.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subsidiary_params
      params.require(:subsidiary).permit(:address, :city_id)
    end
end
