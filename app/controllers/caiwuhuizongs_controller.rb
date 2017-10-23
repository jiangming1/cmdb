class CaiwuhuizongsController < ApplicationController
  before_action :set_caiwuhuizong, only: [:show, :edit, :update, :destroy]

  # GET /caiwuhuizongs
  # GET /caiwuhuizongs.json
  def index
    @caiwuhuizongs = Caiwuhuizong.all
  end

  # GET /caiwuhuizongs/1
  # GET /caiwuhuizongs/1.json
  def show
  end

  # GET /caiwuhuizongs/new
  def new
    @caiwuhuizong = Caiwuhuizong.new
  end

  # GET /caiwuhuizongs/1/edit
  def edit
  end

  # POST /caiwuhuizongs
  # POST /caiwuhuizongs.json
  def create
    @caiwuhuizong = Caiwuhuizong.new(caiwuhuizong_params)

    respond_to do |format|
      if @caiwuhuizong.save
        format.html { redirect_to @caiwuhuizong, notice: 'Caiwuhuizong was successfully created.' }
        format.json { render :show, status: :created, location: @caiwuhuizong }
      else
        format.html { render :new }
        format.json { render json: @caiwuhuizong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caiwuhuizongs/1
  # PATCH/PUT /caiwuhuizongs/1.json
  def update
    respond_to do |format|
      if @caiwuhuizong.update(caiwuhuizong_params)
        format.html { redirect_to @caiwuhuizong, notice: 'Caiwuhuizong was successfully updated.' }
        format.json { render :show, status: :ok, location: @caiwuhuizong }
      else
        format.html { render :edit }
        format.json { render json: @caiwuhuizong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caiwuhuizongs/1
  # DELETE /caiwuhuizongs/1.json
  def destroy
    @caiwuhuizong.destroy
    respond_to do |format|
      format.html { redirect_to caiwuhuizongs_url, notice: 'Caiwuhuizong was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caiwuhuizong
      @caiwuhuizong = Caiwuhuizong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caiwuhuizong_params
      params.require(:caiwuhuizong).permit(:tongjiriqi, :tongjileixing, :jietiaozongbishu, :jietiaojine, :jietiaolixi, :fangkuanzongbishu, :fangkuanjine, :fangkuanlixi, :xujiezongbishu, :xujiejine, :xujielixi, :zongjine)
    end
end
