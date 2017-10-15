class YifangkuansController < ApplicationController
  before_action :set_yifangkuan, only: [:show, :edit, :update, :destroy]

  # GET /yifangkuans
  # GET /yifangkuans.json
  def index
    @yifangkuans = Yifangkuan.all
  end

  # GET /yifangkuans/1
  # GET /yifangkuans/1.json
  def show
  end

  # GET /yifangkuans/new
  def new
    @yifangkuan = Yifangkuan.new
  end

  # GET /yifangkuans/1/edit
  def edit
  end

  # POST /yifangkuans
  # POST /yifangkuans.json
  def create
    @yifangkuan = Yifangkuan.new(yifangkuan_params)

    respond_to do |format|
      if @yifangkuan.save
        format.html { redirect_to @yifangkuan, notice: 'Yifangkuan was successfully created.' }
        format.json { render :show, status: :created, location: @yifangkuan }
      else
        format.html { render :new }
        format.json { render json: @yifangkuan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yifangkuans/1
  # PATCH/PUT /yifangkuans/1.json
  def update
    respond_to do |format|
      if @yifangkuan.update(yifangkuan_params)
        format.html { redirect_to @yifangkuan, notice: 'Yifangkuan was successfully updated.' }
        format.json { render :show, status: :ok, location: @yifangkuan }
      else
        format.html { render :edit }
        format.json { render json: @yifangkuan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yifangkuans/1
  # DELETE /yifangkuans/1.json
  def destroy
    @yifangkuan.destroy
    respond_to do |format|
      format.html { redirect_to yifangkuans_url, notice: 'Yifangkuan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yifangkuan
      @yifangkuan = Yifangkuan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yifangkuan_params
      params.require(:yifangkuan).permit(:xingming, :shoujihao, :jiekuanjine, :jiekuanlixi, :jiekuanqixian, :jiekuanshijian, :fangkuanshijian, :cehui)
    end
end
