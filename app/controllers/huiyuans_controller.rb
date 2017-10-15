class HuiyuansController < ApplicationController
  before_action :set_huiyuan, only: [:show, :edit, :update, :destroy]

  # GET /huiyuans
  # GET /huiyuans.json
  def index
    @huiyuans = Huiyuan.all
  end

  # GET /huiyuans/1
  # GET /huiyuans/1.json
  def show
  end

  # GET /huiyuans/new
  def new
    @huiyuan = Huiyuan.new
  end

  # GET /huiyuans/1/edit
  def edit
  end

  # POST /huiyuans
  # POST /huiyuans.json
  def create
    @huiyuan = Huiyuan.new(huiyuan_params)

    respond_to do |format|
      if @huiyuan.save
        format.html { redirect_to @huiyuan, notice: 'Huiyuan was successfully created.' }
        format.json { render :show, status: :created, location: @huiyuan }
      else
        format.html { render :new }
        format.json { render json: @huiyuan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /huiyuans/1
  # PATCH/PUT /huiyuans/1.json
  def update
    respond_to do |format|
      if @huiyuan.update(huiyuan_params)
        format.html { redirect_to @huiyuan, notice: 'Huiyuan was successfully updated.' }
        format.json { render :show, status: :ok, location: @huiyuan }
      else
        format.html { render :edit }
        format.json { render json: @huiyuan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /huiyuans/1
  # DELETE /huiyuans/1.json
  def destroy
    @huiyuan.destroy
    respond_to do |format|
      format.html { redirect_to huiyuans_url, notice: 'Huiyuan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_huiyuan
      @huiyuan = Huiyuan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def huiyuan_params
      params.require(:huiyuan).permit(:xingming, :shenfenzheng, :yunyingshang, :zhaopian, :fengxiandengji, :jiekuancishu, :tuijianren, :qq, :shenfenzheng, :jiaoyuqingkuang, :juzhushichang, :zhiye, :gongsimingcheng, :gongsidizhi, :qinshu, :guanxi, :yinhangkahao, :yinhangmingcheng, :yinhangyuliushoujihao, :xinxitianxieqingkuang, :yinhangkaxinxitianxieqingkuang, :yonghuzhuangtai, :zuijinjiekuanzhuangtai, :xinyongedu, :laiyuan, :shenheren, :shoujihao, :email, :hunyinzhuangkuang, :zuzhudizhi, :shouru, :gongsichengshi, :gongsidianhua, :qingshudianhua, :guanxidianhua, :yinhanghuming, :suozaichengshi, :yinhangyuliushenfengzhenghaoma)
    end
end
