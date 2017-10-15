class XujiedaifangkuanliebiaosController < ApplicationController
  before_action :set_xujiedaifangkuanliebiao, only: [:show, :edit, :update, :destroy]

  # GET /xujiedaifangkuanliebiaos
  # GET /xujiedaifangkuanliebiaos.json
  def index
    @xujiedaifangkuanliebiaos = Xujiedaifangkuanliebiao.all
  end

  # GET /xujiedaifangkuanliebiaos/1
  # GET /xujiedaifangkuanliebiaos/1.json
  def show
  end

  # GET /xujiedaifangkuanliebiaos/new
  def new
    @xujiedaifangkuanliebiao = Xujiedaifangkuanliebiao.new
  end

  # GET /xujiedaifangkuanliebiaos/1/edit
  def edit
  end

  # POST /xujiedaifangkuanliebiaos
  # POST /xujiedaifangkuanliebiaos.json
  def create
    @xujiedaifangkuanliebiao = Xujiedaifangkuanliebiao.new(xujiedaifangkuanliebiao_params)

    respond_to do |format|
      if @xujiedaifangkuanliebiao.save
        format.html { redirect_to @xujiedaifangkuanliebiao, notice: 'Xujiedaifangkuanliebiao was successfully created.' }
        format.json { render :show, status: :created, location: @xujiedaifangkuanliebiao }
      else
        format.html { render :new }
        format.json { render json: @xujiedaifangkuanliebiao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xujiedaifangkuanliebiaos/1
  # PATCH/PUT /xujiedaifangkuanliebiaos/1.json
  def update
    respond_to do |format|
      if @xujiedaifangkuanliebiao.update(xujiedaifangkuanliebiao_params)
        format.html { redirect_to @xujiedaifangkuanliebiao, notice: 'Xujiedaifangkuanliebiao was successfully updated.' }
        format.json { render :show, status: :ok, location: @xujiedaifangkuanliebiao }
      else
        format.html { render :edit }
        format.json { render json: @xujiedaifangkuanliebiao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xujiedaifangkuanliebiaos/1
  # DELETE /xujiedaifangkuanliebiaos/1.json
  def destroy
    @xujiedaifangkuanliebiao.destroy
    respond_to do |format|
      format.html { redirect_to xujiedaifangkuanliebiaos_url, notice: 'Xujiedaifangkuanliebiao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xujiedaifangkuanliebiao
      @xujiedaifangkuanliebiao = Xujiedaifangkuanliebiao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xujiedaifangkuanliebiao_params
      params.require(:xujiedaifangkuanliebiao).permit(:xingming, :shoujihao, :jiekuanjine, :jiekuanlixi, :jiekuanqixian, :jiekuanshijian, :xujie, :shenheshijian, :shenheren, :tongguo)
    end
end
