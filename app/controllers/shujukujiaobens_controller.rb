class ShujukujiaobensController < ApplicationController
  before_action :set_shujukujiaoben, only: [:show, :edit, :update, :destroy]

  # GET /shujukujiaobens
  # GET /shujukujiaobens.json
  def index
    @shujukujiaobens = Shujukujiaoben.all
  end

  # GET /shujukujiaobens/1
  # GET /shujukujiaobens/1.json
  def show
  end

  # GET /shujukujiaobens/new
  def new
    @shujukujiaoben = Shujukujiaoben.new
  end

  # GET /shujukujiaobens/1/edit
  def edit
  end

  # POST /shujukujiaobens
  # POST /shujukujiaobens.json
  def create
    @shujukujiaoben = Shujukujiaoben.new(shujukujiaoben_params)

    respond_to do |format|
      if @shujukujiaoben.save
        format.html { redirect_to @shujukujiaoben, notice: 'Shujukujiaoben was successfully created.' }
        format.json { render :show, status: :created, location: @shujukujiaoben }
      else
        format.html { render :new }
        format.json { render json: @shujukujiaoben.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shujukujiaobens/1
  # PATCH/PUT /shujukujiaobens/1.json
  def update
    respond_to do |format|
      if @shujukujiaoben.update(shujukujiaoben_params)
        format.html { redirect_to @shujukujiaoben, notice: 'Shujukujiaoben was successfully updated.' }
        format.json { render :show, status: :ok, location: @shujukujiaoben }
      else
        format.html { render :edit }
        format.json { render json: @shujukujiaoben.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shujukujiaobens/1
  # DELETE /shujukujiaobens/1.json
  def destroy
    @shujukujiaoben.destroy
    respond_to do |format|
      format.html { redirect_to shujukujiaobens_url, notice: 'Shujukujiaoben was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shujukujiaoben
      @shujukujiaoben = Shujukujiaoben.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shujukujiaoben_params
      params.require(:shujukujiaoben).permit(:jiaobenmingcheng, :shujuquzhanghao, :mubiaojiqi, :buzhoumingcheng, :jiaobenlaiyuan, :jiaobenneirong, :caoshishijian)
    end
end
