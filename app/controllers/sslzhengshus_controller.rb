class SslzhengshusController < ApplicationController
  before_action :set_sslzhengshu, only: [:show, :edit, :update, :destroy]

  # GET /sslzhengshus
  # GET /sslzhengshus.json
  def index
    @sslzhengshus = Sslzhengshu.all
  end

  # GET /sslzhengshus/1
  # GET /sslzhengshus/1.json
  def show
  end

  # GET /sslzhengshus/new
  def new
    @sslzhengshu = Sslzhengshu.new
  end

  # GET /sslzhengshus/1/edit
  def edit
  end

  # POST /sslzhengshus
  # POST /sslzhengshus.json
  def create
    @sslzhengshu = Sslzhengshu.new(sslzhengshu_params)

    respond_to do |format|
      if @sslzhengshu.save
        format.html { redirect_to @sslzhengshu, notice: 'Sslzhengshu was successfully created.' }
        format.json { render :show, status: :created, location: @sslzhengshu }
      else
        format.html { render :new }
        format.json { render json: @sslzhengshu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sslzhengshus/1
  # PATCH/PUT /sslzhengshus/1.json
  def update
    respond_to do |format|
      if @sslzhengshu.update(sslzhengshu_params)
        format.html { redirect_to @sslzhengshu, notice: 'Sslzhengshu was successfully updated.' }
        format.json { render :show, status: :ok, location: @sslzhengshu }
      else
        format.html { render :edit }
        format.json { render json: @sslzhengshu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sslzhengshus/1
  # DELETE /sslzhengshus/1.json
  def destroy
    @sslzhengshu.destroy
    respond_to do |format|
      format.html { redirect_to sslzhengshus_url, notice: 'Sslzhengshu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sslzhengshu
      @sslzhengshu = Sslzhengshu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sslzhengshu_params
      params.require(:sslzhengshu).permit(:name, :script, :guoqiriqi, :miaoshu)
    end
end
