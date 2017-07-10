class ShujufenxisController < ApplicationController
  before_action :set_shujufenxi, only: [:show, :edit, :update, :destroy]

  # GET /shujufenxis
  # GET /shujufenxis.json
  def index
    @shujufenxis = Shujufenxi.all
  end

  # GET /shujufenxis/1
  # GET /shujufenxis/1.json
  def show
  end

  # GET /shujufenxis/new
  def new
    @shujufenxi = Shujufenxi.new
  end

  # GET /shujufenxis/1/edit
  def edit
  end

  # POST /shujufenxis
  # POST /shujufenxis.json
  def create
    @shujufenxi = Shujufenxi.new(shujufenxi_params)

    respond_to do |format|
      if @shujufenxi.save
        format.html { redirect_to @shujufenxi, notice: 'Shujufenxi was successfully created.' }
        format.json { render :show, status: :created, location: @shujufenxi }
      else
        format.html { render :new }
        format.json { render json: @shujufenxi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shujufenxis/1
  # PATCH/PUT /shujufenxis/1.json
  def update
    respond_to do |format|
      if @shujufenxi.update(shujufenxi_params)
        format.html { redirect_to @shujufenxi, notice: 'Shujufenxi was successfully updated.' }
        format.json { render :show, status: :ok, location: @shujufenxi }
      else
        format.html { render :edit }
        format.json { render json: @shujufenxi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shujufenxis/1
  # DELETE /shujufenxis/1.json
  def destroy
    @shujufenxi.destroy
    respond_to do |format|
      format.html { redirect_to shujufenxis_url, notice: 'Shujufenxi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shujufenxi
      @shujufenxi = Shujufenxi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shujufenxi_params
      params.require(:shujufenxi).permit(:chengxumingcheng, :wangzhi)
    end
end
