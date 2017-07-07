class ShujukuzhanghusController < ApplicationController
  before_action :set_shujukuzhanghu, only: [:show, :edit, :update, :destroy]

  # GET /shujukuzhanghus
  # GET /shujukuzhanghus.json
  def index
    @shujukuzhanghus = Shujukuzhanghu.all
  end

  # GET /shujukuzhanghus/1
  # GET /shujukuzhanghus/1.json
  def show
  end

  # GET /shujukuzhanghus/new
  def new
    @shujukuzhanghu = Shujukuzhanghu.new
  end

  # GET /shujukuzhanghus/1/edit
  def edit
  end

  # POST /shujukuzhanghus
  # POST /shujukuzhanghus.json
  def create
    @shujukuzhanghu = Shujukuzhanghu.new(shujukuzhanghu_params)

    respond_to do |format|
      if @shujukuzhanghu.save
        format.html { redirect_to @shujukuzhanghu, notice: 'Shujukuzhanghu was successfully created.' }
        format.json { render :show, status: :created, location: @shujukuzhanghu }
      else
        format.html { render :new }
        format.json { render json: @shujukuzhanghu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shujukuzhanghus/1
  # PATCH/PUT /shujukuzhanghus/1.json
  def update
    respond_to do |format|
      if @shujukuzhanghu.update(shujukuzhanghu_params)
        format.html { redirect_to @shujukuzhanghu, notice: 'Shujukuzhanghu was successfully updated.' }
        format.json { render :show, status: :ok, location: @shujukuzhanghu }
      else
        format.html { render :edit }
        format.json { render json: @shujukuzhanghu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shujukuzhanghus/1
  # DELETE /shujukuzhanghus/1.json
  def destroy
    @shujukuzhanghu.destroy
    respond_to do |format|
      format.html { redirect_to shujukuzhanghus_url, notice: 'Shujukuzhanghu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shujukuzhanghu
      @shujukuzhanghu = Shujukuzhanghu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shujukuzhanghu_params
      params.require(:shujukuzhanghu).permit(:shujukuzhanghaobieming, :shujukuzhanghao, :shujukumima, :duankou, :leixing, :zhixingdexitongzhanghu)
    end
end
