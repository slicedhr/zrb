class AccountingClassificationsController < ApplicationController
  before_action :set_accounting_classification, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  # GET /accounting_classifications
  # GET /accounting_classifications.json
  def index
    
    @accounting_classifications_grid = initialize_grid(
                      AccountingClassification,
                      name: 'grid',
                      enable_export_to_csv: true,
                      csv_field_separator: ';',
                      csv_file_name: 'accounting_classifications',
                      per_page: 30
                  )
    
    export_grid_if_requested('grid' => 'grid')

  end

  # GET /accounting_classifications/1
  # GET /accounting_classifications/1.json
  def show
  end

  # GET /accounting_classifications/new
  def new
    @accounting_classification = AccountingClassification.new

  end

  # GET /accounting_classifications/1/edit
  def edit
  end

  # POST /accounting_classifications
  # POST /accounting_classifications.json
  def create
    @accounting_classification = AccountingClassification.new(accounting_classification_params)

    respond_to do |format|
      if @accounting_classification.save
        format.html { redirect_to accounting_classifications_url, notice: 'Éxito al guardar.' }
        format.json { render :show, status: :created, location: @accounting_classification }
      else
        format.html { render :new }
        format.json { render json: @accounting_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounting_classifications/1
  # PATCH/PUT /accounting_classifications/1.json
  def update
    respond_to do |format|
      if @accounting_classification.update(accounting_classification_params)
        format.html { redirect_to accounting_classifications_url, notice: 'Éxito al guardar.' }
        format.json { render :show, status: :ok, location: @accounting_classification }
      else
        format.html { render :edit }
        format.json { render json: @accounting_classification.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounting_classifications/1
  # DELETE /accounting_classifications/1.json
  def destroy
    @accounting_classification.destroy
    respond_to do |format|
      format.html { redirect_to accounting_classifications_url, notice: 'Item Eliminado' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting_classification
      @accounting_classification = AccountingClassification.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounting_classification_params
      params.require(:accounting_classification).permit(:account, :name, :ifrs_value, :local_value)
    end
end
