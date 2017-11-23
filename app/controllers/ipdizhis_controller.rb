class IpdizhisController < ApplicationController
  before_action :set_ipdizhi, only: [:show, :edit, :update, :destroy]

  # GET /ipdizhis
  # GET /ipdizhis.json
  def index
	  @ipdizhis = Ipdizhi.all.order("wangduan desc").order("id")
  end

  # GET /ipdizhis/1
  # GET /ipdizhis/1.json
  def show
  end

  # GET /ipdizhis/new
  def new
    @ipdizhi = Ipdizhi.new
  end

  # GET /ipdizhis/1/edit
  def edit
  end

  # POST /ipdizhis
  # POST /ipdizhis.json
  def create
    @ipdizhi = Ipdizhi.new(ipdizhi_params)

    respond_to do |format|
      if @ipdizhi.save
        format.html { redirect_to @ipdizhi, notice: 'Ipdizhi was successfully created.' }
        format.json { render :show, status: :created, location: @ipdizhi }
      else
        format.html { render :new }
        format.json { render json: @ipdizhi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ipdizhis/1
  # PATCH/PUT /ipdizhis/1.json
  def update
    respond_to do |format|
      if @ipdizhi.update(ipdizhi_params)
        format.html { redirect_to @ipdizhi, notice: 'Ipdizhi was successfully updated.' }
        format.json { render :show, status: :ok, location: @ipdizhi }
      else
        format.html { render :edit }
        format.json { render json: @ipdizhi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ipdizhis/1
  # DELETE /ipdizhis/1.json
  def destroy
    @ipdizhi.destroy
    respond_to do |format|
      format.html { redirect_to ipdizhis_url, notice: 'Ipdizhi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ipdizhi
      @ipdizhi = Ipdizhi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ipdizhi_params
      params.require(:ipdizhi).permit(:wangduan, :vlan, :ip, :yanma, :xitongmingcheng, :yingyongduankou, :yuming, :beizhu, :quyu)
    end
end
