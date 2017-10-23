class FengkongcanshusController < ApplicationController
  before_action :set_fengkongcanshu, only: [:show, :edit, :update, :destroy]

  # GET /fengkongcanshus
  # GET /fengkongcanshus.json
  def index
    @fengkongcanshus = Fengkongcanshu.all
  end

  # GET /fengkongcanshus/1
  # GET /fengkongcanshus/1.json
  def show
  end

  # GET /fengkongcanshus/new
  def new
    @fengkongcanshu = Fengkongcanshu.new
  end

  # GET /fengkongcanshus/1/edit
  def edit
  end

  # POST /fengkongcanshus
  # POST /fengkongcanshus.json
  def create
    @fengkongcanshu = Fengkongcanshu.new(fengkongcanshu_params)

    respond_to do |format|
      if @fengkongcanshu.save
        format.html { redirect_to @fengkongcanshu, notice: 'Fengkongcanshu was successfully created.' }
        format.json { render :show, status: :created, location: @fengkongcanshu }
      else
        format.html { render :new }
        format.json { render json: @fengkongcanshu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fengkongcanshus/1
  # PATCH/PUT /fengkongcanshus/1.json
  def update
    respond_to do |format|
      if @fengkongcanshu.update(fengkongcanshu_params)
        format.html { redirect_to @fengkongcanshu, notice: 'Fengkongcanshu was successfully updated.' }
        format.json { render :show, status: :ok, location: @fengkongcanshu }
      else
        format.html { render :edit }
        format.json { render json: @fengkongcanshu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fengkongcanshus/1
  # DELETE /fengkongcanshus/1.json
  def destroy
    @fengkongcanshu.destroy
    respond_to do |format|
      format.html { redirect_to fengkongcanshus_url, notice: 'Fengkongcanshu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fengkongcanshu
      @fengkongcanshu = Fengkongcanshu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fengkongcanshu_params
      params.require(:fengkongcanshu).permit(:bianma, :mingcheng, :zhi1, :zhi2, :shuoming)
    end
end
