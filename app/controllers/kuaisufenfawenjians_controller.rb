class KuaisufenfawenjiansController < ApplicationController
  before_action :set_kuaisufenfawenjian, only: [:show, :edit, :update, :destroy]

  # GET /kuaisufenfawenjians
  # GET /kuaisufenfawenjians.json
  def index
    @kuaisufenfawenjians = Kuaisufenfawenjian.all
  end

  # GET /kuaisufenfawenjians/1
  # GET /kuaisufenfawenjians/1.json
  def show
  end

  # GET /kuaisufenfawenjians/new
  def new
    @kuaisufenfawenjian = Kuaisufenfawenjian.new
  end

  # GET /kuaisufenfawenjians/1/edit
  def edit
  end

  # POST /kuaisufenfawenjians
  # POST /kuaisufenfawenjians.json
  def create
    @kuaisufenfawenjian = Kuaisufenfawenjian.new(kuaisufenfawenjian_params)

    respond_to do |format|
      if @kuaisufenfawenjian.save
        format.html { redirect_to @kuaisufenfawenjian, notice: 'Kuaisufenfawenjian was successfully created.' }
        format.json { render :show, status: :created, location: @kuaisufenfawenjian }
      else
        format.html { render :new }
        format.json { render json: @kuaisufenfawenjian.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kuaisufenfawenjians/1
  # PATCH/PUT /kuaisufenfawenjians/1.json
  def update
    respond_to do |format|
      if @kuaisufenfawenjian.update(kuaisufenfawenjian_params)
        format.html { redirect_to @kuaisufenfawenjian, notice: 'Kuaisufenfawenjian was successfully updated.' }
        format.json { render :show, status: :ok, location: @kuaisufenfawenjian }
      else
        format.html { render :edit }
        format.json { render json: @kuaisufenfawenjian.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kuaisufenfawenjians/1
  # DELETE /kuaisufenfawenjians/1.json
  def destroy
    @kuaisufenfawenjian.destroy
    respond_to do |format|
      format.html { redirect_to kuaisufenfawenjians_url, notice: 'Kuaisufenfawenjian was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kuaisufenfawenjian
      @kuaisufenfawenjian = Kuaisufenfawenjian.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kuaisufenfawenjian_params
      params.require(:kuaisufenfawenjian).permit(:zuoyemingchen, :yuanwenjian, :mubiaowenjian, :zhixingzhanghu, :mubiaojiqi)
    end
end
