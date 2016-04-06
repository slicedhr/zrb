class AfAssetsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_af_asset, only: [:show, :edit, :update, :destroy]



  # GET /af_assets
  # GET /af_assets.json
  def index

    @af_assets_grid = initialize_grid(AfAsset.includes(:asset_name, :af_assets).where( { is_parent: true } ) ,
      name: 'grid',
      csv_field_separator: ';',
      csv_file_name: 'asset_names',
      per_page: 30,
      )
    @accounting_classifications = AccountingClassification.all

    export_grid_if_requested('grid' => 'grid')

   

  end

  # GET /af_assets/1
  # GET /af_assets/1.json
  def show
  end

  # GET /af_assets/new
  def new
    @af_asset = AfAsset.new
  end

  # GET /af_assets/1/edit
  def edit
  end

  # POST /af_assets
  # POST /af_assets.json
  def create
    @af_asset = AfAsset.new(af_asset_params)

    respond_to do |format|
      if @af_asset.save
        format.html { redirect_to af_assets_url, notice: 'Éxito al guardar.' }
        format.json { render :show, status: :created, location: @af_asset }
      else
        format.html { render :new }
        format.json { render json: @af_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /af_assets/1
  # PATCH/PUT /af_assets/1.json
  def update
    respond_to do |format|
      if @af_asset.update(af_asset_params)
        format.html { redirect_to @af_asset, notice: 'Éxito al guardar.' }
        format.json { render :show, status: :ok, location: @af_asset }
      else
        format.html { render :edit }
        format.json { render json: @af_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /af_assets/1
  # DELETE /af_assets/1.json
  def destroy
    @af_asset.destroy
    respond_to do |format|
      format.html { redirect_to af_assets_url, notice: 'Item Eliminado' }
      format.json { head :no_content }
    end
  end

  def get_children

    id = params[:id]

    @children = AfAsset.where(af_asset_id: id);

    # raise @children
    render json: @children.to_json(:include => [:user, :asset_name])

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_af_asset
      @af_asset = AfAsset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def af_asset_params
      params.require(:af_asset).permit(:asset_name_id, :quantity, :serial, :model, :reference, :tech_plaque, :old_plaque, :current_plaque, :characteristics, :comments, :purchase_value, :purchase_date, :age, :factor_m, :factor_r, :vuef, :reposition_price, :accounting_crossing, :is_parent, :accounting_classification_id, :custodian_id, :internal_location_id, :subsidiary_id, :city_id, :user_id, :root_category_id, :af_asset_id, :is_verifiqued)
    end
end
