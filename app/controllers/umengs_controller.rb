class UmengsController < ApplicationController
  before_action :set_umeng, only: [:show, :edit, :update, :destroy]

  # GET /umengs
  # GET /umengs.json
  def index
    @umengs = Umeng.all
  end

  # GET /umengs/1
  # GET /umengs/1.json
  def show
  end

  # GET /umengs/new
  def new
    @umeng = Umeng.new
  end

  # GET /umengs/1/edit
  def edit
  end

  # POST /umengs
  # POST /umengs.json
  def create
    @umeng = Umeng.new(umeng_params)

    respond_to do |format|
      if @umeng.save
        format.html { redirect_to @umeng, notice: 'Umeng was successfully created.' }
        format.json { render :show, status: :created, location: @umeng }
      else
        format.html { render :new }
        format.json { render json: @umeng.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /umengs/1
  # PATCH/PUT /umengs/1.json
  def update
    respond_to do |format|
      if @umeng.update(umeng_params)
        format.html { redirect_to @umeng, notice: 'Umeng was successfully updated.' }
        format.json { render :show, status: :ok, location: @umeng }
      else
        format.html { render :edit }
        format.json { render json: @umeng.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /umengs/1
  # DELETE /umengs/1.json
  def destroy
    @umeng.destroy
    respond_to do |format|
      format.html { redirect_to umengs_url, notice: 'Umeng was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_umeng
      @umeng = Umeng.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def umeng_params
      params.require(:umeng).permit(:yingyongming, :jinrixinzeng, :huoyueyonghu, :zuoriqidongcishu, :zuorileiji)
    end
end
