class KuaisuzhixingsqljiaobensController < ApplicationController
  before_action :set_kuaisuzhixingsqljiaoben, only: [:show, :edit, :update, :destroy]

  # GET /kuaisuzhixingsqljiaobens
  # GET /kuaisuzhixingsqljiaobens.json
  def index
    @kuaisuzhixingsqljiaobens = Kuaisuzhixingsqljiaoben.all
  end

  # GET /kuaisuzhixingsqljiaobens/1
  # GET /kuaisuzhixingsqljiaobens/1.json
  def show
  end

  # GET /kuaisuzhixingsqljiaobens/new
  def new
    @kuaisuzhixingsqljiaoben = Kuaisuzhixingsqljiaoben.new
  end

  # GET /kuaisuzhixingsqljiaobens/1/edit
  def edit
  end

  # POST /kuaisuzhixingsqljiaobens
  # POST /kuaisuzhixingsqljiaobens.json
  def create
    @kuaisuzhixingsqljiaoben = Kuaisuzhixingsqljiaoben.new(kuaisuzhixingsqljiaoben_params)

    respond_to do |format|
      if @kuaisuzhixingsqljiaoben.save
        format.html { redirect_to @kuaisuzhixingsqljiaoben, notice: 'Kuaisuzhixingsqljiaoben was successfully created.' }
        format.json { render :show, status: :created, location: @kuaisuzhixingsqljiaoben }
      else
        format.html { render :new }
        format.json { render json: @kuaisuzhixingsqljiaoben.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kuaisuzhixingsqljiaobens/1
  # PATCH/PUT /kuaisuzhixingsqljiaobens/1.json
  def update
    respond_to do |format|
      if @kuaisuzhixingsqljiaoben.update(kuaisuzhixingsqljiaoben_params)
        format.html { redirect_to @kuaisuzhixingsqljiaoben, notice: 'Kuaisuzhixingsqljiaoben was successfully updated.' }
        format.json { render :show, status: :ok, location: @kuaisuzhixingsqljiaoben }
      else
        format.html { render :edit }
        format.json { render json: @kuaisuzhixingsqljiaoben.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kuaisuzhixingsqljiaobens/1
  # DELETE /kuaisuzhixingsqljiaobens/1.json
  def destroy
    @kuaisuzhixingsqljiaoben.destroy
    respond_to do |format|
      format.html { redirect_to kuaisuzhixingsqljiaobens_url, notice: 'Kuaisuzhixingsqljiaoben was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kuaisuzhixingsqljiaoben
      @kuaisuzhixingsqljiaoben = Kuaisuzhixingsqljiaoben.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kuaisuzhixingsqljiaoben_params
      params.require(:kuaisuzhixingsqljiaoben).permit(:jiaobenmingchen, :dbzhanghaobieming, :mubiaojiqi, :jiaobenneirong, :chaoshishijian)
    end
end
