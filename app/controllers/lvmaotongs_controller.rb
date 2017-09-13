class LvmaotongsController < ApplicationController
  before_action :set_lvmaotong, only: [:show, :edit, :update, :destroy]

  # GET /lvmaotongs
  # GET /lvmaotongs.json
  def index
    @lvmaotongs = Lvmaotong.all
  end

  # GET /lvmaotongs/1
  # GET /lvmaotongs/1.json
  def show
  end

  # GET /lvmaotongs/new
  def new
    @lvmaotong = Lvmaotong.new
  end

  # GET /lvmaotongs/1/edit
  def edit
  end

  # POST /lvmaotongs
  # POST /lvmaotongs.json
  def create
    @lvmaotong = Lvmaotong.new(lvmaotong_params)

    respond_to do |format|
      if @lvmaotong.save
        format.html { redirect_to @lvmaotong, notice: 'Lvmaotong was successfully created.' }
        format.json { render :show, status: :created, location: @lvmaotong }
      else
        format.html { render :new }
        format.json { render json: @lvmaotong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lvmaotongs/1
  # PATCH/PUT /lvmaotongs/1.json
  def update
    respond_to do |format|
      if @lvmaotong.update(lvmaotong_params)
        format.html { redirect_to @lvmaotong, notice: 'Lvmaotong was successfully updated.' }
        format.json { render :show, status: :ok, location: @lvmaotong }
      else
        format.html { render :edit }
        format.json { render json: @lvmaotong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lvmaotongs/1
  # DELETE /lvmaotongs/1.json
  def destroy
    @lvmaotong.destroy
    respond_to do |format|
      format.html { redirect_to lvmaotongs_url, notice: 'Lvmaotong was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lvmaotong
      @lvmaotong = Lvmaotong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lvmaotong_params
      params.require(:lvmaotong).permit(:xingming, :dianhua)
    end
end
