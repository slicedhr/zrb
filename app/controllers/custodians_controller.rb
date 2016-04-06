# encoding: utf-8
class CustodiansController < ApplicationController
  before_action :authenticate_user!
  before_action :set_custodian, only: [:show, :edit, :update, :destroy]

  # GET /custodians
  # GET /custodians.json
  def index
     @custodians_grid = initialize_grid(Custodian,
        name: 'grid',
        csv_field_separator: ';',
        csv_file_name: 'custodians',
        per_page: 30,
        )

    export_grid_if_requested('grid' => 'grid')
  end

  # GET /custodians/1
  # GET /custodians/1.json
  def show
  end

  # GET /custodians/new
  def new
    @custodian = Custodian.new
  end

  # GET /custodians/1/edit
  def edit
  end

  # POST /custodians
  # POST /custodians.json
  def create
    @custodian = Custodian.new(custodian_params)

    respond_to do |format|
      if @custodian.save
        format.html { redirect_to custodians_url, notice: 'Éxito al guardar.' }
        format.json { render :show, status: :created, location: @custodian }
      else
        format.html { render :new }
        format.json { render json: @custodian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /custodians/1
  # PATCH/PUT /custodians/1.json
  def update
    respond_to do |format|
      if @custodian.update(custodian_params)
        format.html { redirect_to custodians_url, notice: 'Éxito al guardar.' }
        format.json { render :show, status: :ok, location: @custodian }
      else
        format.html { render :edit }
        format.json { render json: @custodian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custodians/1
  # DELETE /custodians/1.json
  def destroy
    @custodian.destroy
    respond_to do |format|
      format.html { redirect_to custodians_url, notice: 'Item Eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_custodian
      @custodian = Custodian.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def custodian_params
      params.require(:custodian).permit(:full_name, :office_work, :identification, :phones, :email)
    end
end
