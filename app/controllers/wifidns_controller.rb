class WifidnsController < ApplicationController
  before_action :set_wifidn, only: [:show, :edit, :update, :destroy]

  # GET /wifidns
  # GET /wifidns.json
  def index
    @wifidns = Wifidn.all
  end

  # GET /wifidns/1
  # GET /wifidns/1.json
  def show
  end

  # GET /wifidns/new
  def new
    @wifidn = Wifidn.new
  end

  # GET /wifidns/1/edit
  def edit
  end

  # POST /wifidns
  # POST /wifidns.json
  def create
    @wifidn = Wifidn.new(wifidn_params)

    respond_to do |format|
      if @wifidn.save
        format.html { redirect_to @wifidn, notice: 'Wifidn was successfully created.' }
        format.json { render :show, status: :created, location: @wifidn }
      else
        format.html { render :new }
        format.json { render json: @wifidn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wifidns/1
  # PATCH/PUT /wifidns/1.json
  def update
    respond_to do |format|
      if @wifidn.update(wifidn_params)
        format.html { redirect_to @wifidn, notice: 'Wifidn was successfully updated.' }
        format.json { render :show, status: :ok, location: @wifidn }
      else
        format.html { render :edit }
        format.json { render json: @wifidn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wifidns/1
  # DELETE /wifidns/1.json
  def destroy
    @wifidn.destroy
    respond_to do |format|
      format.html { redirect_to wifidns_url, notice: 'Wifidn was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wifidn
      @wifidn = Wifidn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wifidn_params
      params.require(:wifidn).permit(:name, :script, :miaoshu)
    end
end
