class GuanliyuansController < ApplicationController
  before_action :set_guanliyuan, only: [:show, :edit, :update, :destroy]

  # GET /guanliyuans
  # GET /guanliyuans.json
  def index
    @guanliyuans = Guanliyuan.all
  end

  # GET /guanliyuans/1
  # GET /guanliyuans/1.json
  def show
  end

  # GET /guanliyuans/new
  def new
    @guanliyuan = Guanliyuan.new
  end

  # GET /guanliyuans/1/edit
  def edit
  end

  # POST /guanliyuans
  # POST /guanliyuans.json
  def create
    @guanliyuan = Guanliyuan.new(guanliyuan_params)

    respond_to do |format|
      if @guanliyuan.save
        format.html { redirect_to @guanliyuan, notice: 'Guanliyuan was successfully created.' }
        format.json { render :show, status: :created, location: @guanliyuan }
      else
        format.html { render :new }
        format.json { render json: @guanliyuan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guanliyuans/1
  # PATCH/PUT /guanliyuans/1.json
  def update
    respond_to do |format|
      if @guanliyuan.update(guanliyuan_params)
        format.html { redirect_to @guanliyuan, notice: 'Guanliyuan was successfully updated.' }
        format.json { render :show, status: :ok, location: @guanliyuan }
      else
        format.html { render :edit }
        format.json { render json: @guanliyuan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guanliyuans/1
  # DELETE /guanliyuans/1.json
  def destroy
    @guanliyuan.destroy
    respond_to do |format|
      format.html { redirect_to guanliyuans_url, notice: 'Guanliyuan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_guanliyuan
      @guanliyuan = Guanliyuan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def guanliyuan_params
      params.require(:guanliyuan).permit(:zhanghao, :xingming, :chuangjianshijian, :dengji, :suoshujiaose, :suoshujigou, :xingbie, :shouji, :qiyong)
    end
end
