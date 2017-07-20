class DengluzhanghusController < ApplicationController
  before_action :set_dengluzhanghu, only: [:show, :edit, :update, :destroy]
  # GET /dengluzhanghus
  # GET /dengluzhanghus.json
  def index
    @dengluzhanghus = Dengluzhanghu.all
  end


  
  # GET /dengluzhanghus/1
  # GET /dengluzhanghus/1.json
  def show
   @dengluzhanghu = Dengluzhanghu.new
  end

  # GET /dengluzhanghus/new
  def new
    @dengluzhanghu = Dengluzhanghu.new
  end

  # GET /dengluzhanghus/1/edit
  def edit
  end

  # POST /dengluzhanghus
  # POST /dengluzhanghus.json
  def create
  
    @dengluzhanghu = Dengluzhanghu.new(dengluzhanghu_params)
    respond_to do |format|
      if @dengluzhanghu.save
        format.html { redirect_to @dengluzhanghu, notice: 'Dengluzhanghu was successfully created.' }
        format.json { render :show, status: :created, location: @dengluzhanghu }
      else
        format.html { render :new }
        format.json { render json: @dengluzhanghu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dengluzhanghus/1
  # PATCH/PUT /dengluzhanghus/1.json
  def update
    respond_to do |format|
      if @dengluzhanghu.update(dengluzhanghu_params)
        format.html { redirect_to @dengluzhanghu, notice: 'Dengluzhanghu was successfully updated.' }
        format.json { render :show, status: :ok, location: @dengluzhanghu }
      else
        format.html { render :edit }
        format.json { render json: @dengluzhanghu.errors, status: :unprocessable_entity }
      end
    end
  end
  def login

  end
  def login
  #.find_by(name: 'David')
    @dengluzhanghu = Dengluzhanghu.find_by(zhanghaomingcheng:params["zhanghaomingcheng"],zhanghaomima:params["zhanghaomima"])
    if @dengluzhanghu==nil then
    @dengluzhanghu = Dengluzhanghu.new

    else
    cookies[:id] = @dengluzhanghu.id
    redirect_to :action => 'index'
    end
  end
  # DELETE /dengluzhanghus/1
  # DELETE /dengluzhanghus/1.json
  def destroy
    @dengluzhanghu.destroy
    respond_to do |format|
      format.html { redirect_to dengluzhanghus_url, notice: 'Dengluzhanghu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dengluzhanghu
      @dengluzhanghu = Dengluzhanghu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dengluzhanghu_params
      params.require(:dengluzhanghu).permit(:zhanghaomingcheng, :zhanghaomima)
    end
end
