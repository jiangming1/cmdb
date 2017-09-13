class KaiguansController < ApplicationController
  before_action :set_kaiguan, only: [:show, :edit, :update, :destroy]

  # GET /kaiguans
  # GET /kaiguans.json
  def index
    @kaiguans = Kaiguan.all
  end

  # GET /kaiguans/1
  # GET /kaiguans/1.json
  def show
  end

  # GET /kaiguans/new
  def new
    @kaiguan = Kaiguan.new
  end

  # GET /kaiguans/1/edit
  def edit
  end

  # POST /kaiguans
  # POST /kaiguans.json
  def create
    @kaiguan = Kaiguan.new(kaiguan_params)

    respond_to do |format|
      if @kaiguan.save
        format.html { redirect_to @kaiguan, notice: 'Kaiguan was successfully created.' }
        format.json { render :show, status: :created, location: @kaiguan }
      else
        format.html { render :new }
        format.json { render json: @kaiguan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /kaiguans/1
  # PATCH/PUT /kaiguans/1.json
  def update
    respond_to do |format|
      if @kaiguan.update(kaiguan_params)
        format.html { redirect_to @kaiguan, notice: 'Kaiguan was successfully updated.' }
        format.json { render :show, status: :ok, location: @kaiguan }
      else
        format.html { render :edit }
        format.json { render json: @kaiguan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /kaiguans/1
  # DELETE /kaiguans/1.json
  def destroy
    @kaiguan.destroy
    respond_to do |format|
      format.html { redirect_to kaiguans_url, notice: 'Kaiguan was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_kaiguan
      @kaiguan = Kaiguan.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def kaiguan_params
      params.require(:kaiguan).permit(:xingming, :kaiqi)
    end
end
