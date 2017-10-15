class DianhuahuangyesController < ApplicationController
  before_action :set_dianhuahuangye, only: [:show, :edit, :update, :destroy]

  # GET /dianhuahuangyes
  # GET /dianhuahuangyes.json
  def index
    @dianhuahuangyes = Dianhuahuangye.all
  end

  # GET /dianhuahuangyes/1
  # GET /dianhuahuangyes/1.json
  def show
  end

  # GET /dianhuahuangyes/new
  def new
    @dianhuahuangye = Dianhuahuangye.new
  end

  # GET /dianhuahuangyes/1/edit
  def edit
  end

  # POST /dianhuahuangyes
  # POST /dianhuahuangyes.json
  def create
    @dianhuahuangye = Dianhuahuangye.new(dianhuahuangye_params)

    respond_to do |format|
      if @dianhuahuangye.save
        format.html { redirect_to @dianhuahuangye, notice: 'Dianhuahuangye was successfully created.' }
        format.json { render :show, status: :created, location: @dianhuahuangye }
      else
        format.html { render :new }
        format.json { render json: @dianhuahuangye.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dianhuahuangyes/1
  # PATCH/PUT /dianhuahuangyes/1.json
  def update
    respond_to do |format|
      if @dianhuahuangye.update(dianhuahuangye_params)
        format.html { redirect_to @dianhuahuangye, notice: 'Dianhuahuangye was successfully updated.' }
        format.json { render :show, status: :ok, location: @dianhuahuangye }
      else
        format.html { render :edit }
        format.json { render json: @dianhuahuangye.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dianhuahuangyes/1
  # DELETE /dianhuahuangyes/1.json
  def destroy
    @dianhuahuangye.destroy
    respond_to do |format|
      format.html { redirect_to dianhuahuangyes_url, notice: 'Dianhuahuangye was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dianhuahuangye
      @dianhuahuangye = Dianhuahuangye.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dianhuahuangye_params
      params.require(:dianhuahuangye).permit(:dianhuahaoma, :mingcheng, :guanzhuchengdu, :shuoming)
    end
end
