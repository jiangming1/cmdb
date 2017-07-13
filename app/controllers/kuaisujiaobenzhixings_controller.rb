class KuaisujiaobenzhixingsController < ApplicationController
  before_action :set_kuaisujiaobenzhixing, only: [:show, :edit, :update, :destroy]

  # GET /kuaisujiaobenzhixings
  # GET /kuaisujiaobenzhixings.json
  def index
    @kuaisujiaobenzhixings = Kuaisujiaobenzhixing.all
  end

  # GET /kuaisujiaobenzhixings/1
  # GET /kuaisujiaobenzhixings/1.json
  def show
  
  end

  # GET /kuaisujiaobenzhixings/new
  def new
    @kuaisujiaobenzhixing = Kuaisujiaobenzhixing.new
  end

  # GET /kuaisujiaobenzhixings/1/edit
  def edit
  end

  # POST /kuaisujiaobenzhixings
  # POST /kuaisujiaobenzhixings.json
  def create
    @kuaisujiaobenzhixing = Kuaisujiaobenzhixing.new(kuaisujiaobenzhixing_params)

    respond_to do |format|
      if @kuaisujiaobenzhixing.save
        format.html { redirect_to @kuaisujiaobenzhixing, notice: 'Kuaisujiaobenzhixing was successfully created.' }
        format.json { render :show, status: :created, location: @kuaisujiaobenzhixing }
      else
        format.html { render :new }
        format.json { render json: @kuaisujiaobenzhixing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kuaisujiaobenzhixings/1
  # PATCH/PUT /kuaisujiaobenzhixings/1.json
  def update
    respond_to do |format|
      if @kuaisujiaobenzhixing.update(kuaisujiaobenzhixing_params)
        format.html { redirect_to @kuaisujiaobenzhixing, notice: 'Kuaisujiaobenzhixing was successfully updated.' }
        format.json { render :show, status: :ok, location: @kuaisujiaobenzhixing }
      else
        format.html { render :edit }
        format.json { render json: @kuaisujiaobenzhixing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kuaisujiaobenzhixings/1
  # DELETE /kuaisujiaobenzhixings/1.json
  def destroy
    @kuaisujiaobenzhixing.destroy
    respond_to do |format|
      format.html { redirect_to kuaisujiaobenzhixings_url, notice: 'Kuaisujiaobenzhixing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kuaisujiaobenzhixing
      @kuaisujiaobenzhixing = Kuaisujiaobenzhixing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kuaisujiaobenzhixing_params
      params.require(:kuaisujiaobenzhixing).permit(:jiaobenmingchen, :zhixingzhanghu, :mubiaojiqi, :jiaobenlaiyuan, :jiaobenneirong, :jiaobencanshu, :chaoshishijian)
    end
end
