class LcbzhanghusController < ApplicationController
  before_action :set_lcbzhanghu, only: [:show, :edit, :update, :destroy]

  # GET /lcbzhanghus
  # GET /lcbzhanghus.json
  def index
    @lcbzhanghus = Lcbzhanghu.all
  end

  # GET /lcbzhanghus/1
  # GET /lcbzhanghus/1.json
  def show
  end

  # GET /lcbzhanghus/new
  def new
    @lcbzhanghu = Lcbzhanghu.new
  end

  # GET /lcbzhanghus/1/edit
  def edit
  end

  # POST /lcbzhanghus
  # POST /lcbzhanghus.json
  def create
    @lcbzhanghu = Lcbzhanghu.new(lcbzhanghu_params)

    respond_to do |format|
      if @lcbzhanghu.save
        format.html { redirect_to @lcbzhanghu, notice: 'Lcbzhanghu was successfully created.' }
        format.json { render :show, status: :created, location: @lcbzhanghu }
      else
        format.html { render :new }
        format.json { render json: @lcbzhanghu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lcbzhanghus/1
  # PATCH/PUT /lcbzhanghus/1.json
  def update
    respond_to do |format|
      if @lcbzhanghu.update(lcbzhanghu_params)
        format.html { redirect_to @lcbzhanghu, notice: 'Lcbzhanghu was successfully updated.' }
        format.json { render :show, status: :ok, location: @lcbzhanghu }
      else
        format.html { render :edit }
        format.json { render json: @lcbzhanghu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lcbzhanghus/1
  # DELETE /lcbzhanghus/1.json
  def destroy
    @lcbzhanghu.destroy
    respond_to do |format|
      format.html { redirect_to lcbzhanghus_url, notice: 'Lcbzhanghu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lcbzhanghu
      @lcbzhanghu = Lcbzhanghu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lcbzhanghu_params
      params.require(:lcbzhanghu).permit(:denglumima, :dengluxingming, :shouji, :xingming, :zhifumima, :yaoqingma, :yaoqingren, :zhuangtai)
    end
end
