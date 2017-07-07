class DingshirenwusController < ApplicationController
  before_action :set_dingshirenwu, only: [:show, :edit, :update, :destroy]

  # GET /dingshirenwus
  # GET /dingshirenwus.json
  def index
    @dingshirenwus = Dingshirenwu.all
  end

  # GET /dingshirenwus/1
  # GET /dingshirenwus/1.json
  def show
  end

  # GET /dingshirenwus/new
  def new
    @dingshirenwu = Dingshirenwu.new
  end

  # GET /dingshirenwus/1/edit
  def edit
  end

  # POST /dingshirenwus
  # POST /dingshirenwus.json
  def create
    @dingshirenwu = Dingshirenwu.new(dingshirenwu_params)

    respond_to do |format|
      if @dingshirenwu.save
        format.html { redirect_to @dingshirenwu, notice: 'Dingshirenwu was successfully created.' }
        format.json { render :show, status: :created, location: @dingshirenwu }
      else
        format.html { render :new }
        format.json { render json: @dingshirenwu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dingshirenwus/1
  # PATCH/PUT /dingshirenwus/1.json
  def update
    respond_to do |format|
      if @dingshirenwu.update(dingshirenwu_params)
        format.html { redirect_to @dingshirenwu, notice: 'Dingshirenwu was successfully updated.' }
        format.json { render :show, status: :ok, location: @dingshirenwu }
      else
        format.html { render :edit }
        format.json { render json: @dingshirenwu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dingshirenwus/1
  # DELETE /dingshirenwus/1.json
  def destroy
    @dingshirenwu.destroy
    respond_to do |format|
      format.html { redirect_to dingshirenwus_url, notice: 'Dingshirenwu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dingshirenwu
      @dingshirenwu = Dingshirenwu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dingshirenwu_params
      params.require(:dingshirenwu).permit(:dingshirenwu, :zuoyemingchen, :dingshiguize)
    end
end
