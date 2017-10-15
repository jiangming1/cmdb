class XinyonghudaifangkuanliebiaosController < ApplicationController
  before_action :set_xinyonghudaifangkuanliebiao, only: [:show, :edit, :update, :destroy]

  # GET /xinyonghudaifangkuanliebiaos
  # GET /xinyonghudaifangkuanliebiaos.json
  def index
    @xinyonghudaifangkuanliebiaos = Xinyonghudaifangkuanliebiao.all
  end

  # GET /xinyonghudaifangkuanliebiaos/1
  # GET /xinyonghudaifangkuanliebiaos/1.json
  def show
  end

  # GET /xinyonghudaifangkuanliebiaos/new
  def new
    @xinyonghudaifangkuanliebiao = Xinyonghudaifangkuanliebiao.new
  end

  # GET /xinyonghudaifangkuanliebiaos/1/edit
  def edit
  end

  # POST /xinyonghudaifangkuanliebiaos
  # POST /xinyonghudaifangkuanliebiaos.json
  def create
    @xinyonghudaifangkuanliebiao = Xinyonghudaifangkuanliebiao.new(xinyonghudaifangkuanliebiao_params)

    respond_to do |format|
      if @xinyonghudaifangkuanliebiao.save
        format.html { redirect_to @xinyonghudaifangkuanliebiao, notice: 'Xinyonghudaifangkuanliebiao was successfully created.' }
        format.json { render :show, status: :created, location: @xinyonghudaifangkuanliebiao }
      else
        format.html { render :new }
        format.json { render json: @xinyonghudaifangkuanliebiao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xinyonghudaifangkuanliebiaos/1
  # PATCH/PUT /xinyonghudaifangkuanliebiaos/1.json
  def update
    respond_to do |format|
      if @xinyonghudaifangkuanliebiao.update(xinyonghudaifangkuanliebiao_params)
        format.html { redirect_to @xinyonghudaifangkuanliebiao, notice: 'Xinyonghudaifangkuanliebiao was successfully updated.' }
        format.json { render :show, status: :ok, location: @xinyonghudaifangkuanliebiao }
      else
        format.html { render :edit }
        format.json { render json: @xinyonghudaifangkuanliebiao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xinyonghudaifangkuanliebiaos/1
  # DELETE /xinyonghudaifangkuanliebiaos/1.json
  def destroy
    @xinyonghudaifangkuanliebiao.destroy
    respond_to do |format|
      format.html { redirect_to xinyonghudaifangkuanliebiaos_url, notice: 'Xinyonghudaifangkuanliebiao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xinyonghudaifangkuanliebiao
      @xinyonghudaifangkuanliebiao = Xinyonghudaifangkuanliebiao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xinyonghudaifangkuanliebiao_params
      params.require(:xinyonghudaifangkuanliebiao).permit(:xingming, :shoujihao, :jiekuanjine, :jiekuanlixi, :jiekuanqixian, :jiekuanshijian, :shenheren)
    end
end
