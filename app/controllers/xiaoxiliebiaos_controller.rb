class XiaoxiliebiaosController < ApplicationController
  before_action :set_xiaoxiliebiao, only: [:show, :edit, :update, :destroy]

  # GET /xiaoxiliebiaos
  # GET /xiaoxiliebiaos.json
  def index
    @xiaoxiliebiaos = Xiaoxiliebiao.all
  end

  # GET /xiaoxiliebiaos/1
  # GET /xiaoxiliebiaos/1.json
  def show
  end

  # GET /xiaoxiliebiaos/new
  def new
    @xiaoxiliebiao = Xiaoxiliebiao.new
  end

  # GET /xiaoxiliebiaos/1/edit
  def edit
  end

  # POST /xiaoxiliebiaos
  # POST /xiaoxiliebiaos.json
  def create
    @xiaoxiliebiao = Xiaoxiliebiao.new(xiaoxiliebiao_params)

    respond_to do |format|
      if @xiaoxiliebiao.save
        format.html { redirect_to @xiaoxiliebiao, notice: 'Xiaoxiliebiao was successfully created.' }
        format.json { render :show, status: :created, location: @xiaoxiliebiao }
      else
        format.html { render :new }
        format.json { render json: @xiaoxiliebiao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xiaoxiliebiaos/1
  # PATCH/PUT /xiaoxiliebiaos/1.json
  def update
    respond_to do |format|
      if @xiaoxiliebiao.update(xiaoxiliebiao_params)
        format.html { redirect_to @xiaoxiliebiao, notice: 'Xiaoxiliebiao was successfully updated.' }
        format.json { render :show, status: :ok, location: @xiaoxiliebiao }
      else
        format.html { render :edit }
        format.json { render json: @xiaoxiliebiao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xiaoxiliebiaos/1
  # DELETE /xiaoxiliebiaos/1.json
  def destroy
    @xiaoxiliebiao.destroy
    respond_to do |format|
      format.html { redirect_to xiaoxiliebiaos_url, notice: 'Xiaoxiliebiao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xiaoxiliebiao
      @xiaoxiliebiao = Xiaoxiliebiao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xiaoxiliebiao_params
      params.require(:xiaoxiliebiao).permit(:yonghuxingming, :shoujihao, :xiaoxileixing, :chuangjianshijian, :biaoti, :neirong, :caozuo)
    end
end
