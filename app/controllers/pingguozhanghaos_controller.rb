class PingguozhanghaosController < ApplicationController
  before_action :set_pingguozhanghao, only: [:show, :edit, :update, :destroy]

  # GET /pingguozhanghaos
  # GET /pingguozhanghaos.json
  def index
    @pingguozhanghaos = Pingguozhanghao.all
  end

  # GET /pingguozhanghaos/1
  # GET /pingguozhanghaos/1.json
  def show
  end

  # GET /pingguozhanghaos/new
  def new
    @pingguozhanghao = Pingguozhanghao.new
  end

  # GET /pingguozhanghaos/1/edit
  def edit
  end

  # POST /pingguozhanghaos
  # POST /pingguozhanghaos.json
  def create
    @pingguozhanghao = Pingguozhanghao.new(pingguozhanghao_params)

    respond_to do |format|
      if @pingguozhanghao.save
        format.html { redirect_to @pingguozhanghao, notice: 'Pingguozhanghao was successfully created.' }
        format.json { render :show, status: :created, location: @pingguozhanghao }
      else
        format.html { render :new }
        format.json { render json: @pingguozhanghao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pingguozhanghaos/1
  # PATCH/PUT /pingguozhanghaos/1.json
  def update
    respond_to do |format|
      if @pingguozhanghao.update(pingguozhanghao_params)
        format.html { redirect_to @pingguozhanghao, notice: 'Pingguozhanghao was successfully updated.' }
        format.json { render :show, status: :ok, location: @pingguozhanghao }
      else
        format.html { render :edit }
        format.json { render json: @pingguozhanghao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pingguozhanghaos/1
  # DELETE /pingguozhanghaos/1.json
  def destroy
    @pingguozhanghao.destroy
    respond_to do |format|
      format.html { redirect_to pingguozhanghaos_url, notice: 'Pingguozhanghao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pingguozhanghao
      @pingguozhanghao = Pingguozhanghao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pingguozhanghao_params
      params.require(:pingguozhanghao).permit(:zhanghao, :zhanghaomima, :beizhu, :zhuangtai)
    end
end
