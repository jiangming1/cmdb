class FengxianguanlisController < ApplicationController
  before_action :set_fengxianguanli, only: [:show, :edit, :update, :destroy]

  # GET /fengxianguanlis
  # GET /fengxianguanlis.json
  def index
    @fengxianguanlis = Fengxianguanli.all
  end

  # GET /fengxianguanlis/1
  # GET /fengxianguanlis/1.json
  def show
  end

  # GET /fengxianguanlis/new
  def new
    @fengxianguanli = Fengxianguanli.new
  end

  # GET /fengxianguanlis/1/edit
  def edit
  end

  # POST /fengxianguanlis
  # POST /fengxianguanlis.json
  def create
    @fengxianguanli = Fengxianguanli.new(fengxianguanli_params)

    respond_to do |format|
      if @fengxianguanli.save
        format.html { redirect_to @fengxianguanli, notice: 'Fengxianguanli was successfully created.' }
        format.json { render :show, status: :created, location: @fengxianguanli }
      else
        format.html { render :new }
        format.json { render json: @fengxianguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fengxianguanlis/1
  # PATCH/PUT /fengxianguanlis/1.json
  def update
    respond_to do |format|
      if @fengxianguanli.update(fengxianguanli_params)
        format.html { redirect_to @fengxianguanli, notice: 'Fengxianguanli was successfully updated.' }
        format.json { render :show, status: :ok, location: @fengxianguanli }
      else
        format.html { render :edit }
        format.json { render json: @fengxianguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fengxianguanlis/1
  # DELETE /fengxianguanlis/1.json
  def destroy
    @fengxianguanli.destroy
    respond_to do |format|
      format.html { redirect_to fengxianguanlis_url, notice: 'Fengxianguanli was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fengxianguanli
      @fengxianguanli = Fengxianguanli.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fengxianguanli_params
      params.require(:fengxianguanli).permit(:xingming, :shoujihao, :fenxiandengji, :shuoming)
    end
end
