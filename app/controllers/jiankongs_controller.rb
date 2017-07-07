class JiankongsController < ApplicationController
  before_action :set_jiankong, only: [:show, :edit, :update, :destroy]

  # GET /jiankongs
  # GET /jiankongs.json
  def index
    @jiankongs = Jiankong.all
  end

  # GET /jiankongs/1
  # GET /jiankongs/1.json
  def show
  end

  # GET /jiankongs/new
  def new
    @jiankong = Jiankong.new
  end

  # GET /jiankongs/1/edit
  def edit
  end

  # POST /jiankongs
  # POST /jiankongs.json
  def create
    @jiankong = Jiankong.new(jiankong_params)

    respond_to do |format|
      if @jiankong.save
        format.html { redirect_to @jiankong, notice: 'Jiankong was successfully created.' }
        format.json { render :show, status: :created, location: @jiankong }
      else
        format.html { render :new }
        format.json { render json: @jiankong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jiankongs/1
  # PATCH/PUT /jiankongs/1.json
  def update
    respond_to do |format|
      if @jiankong.update(jiankong_params)
        format.html { redirect_to @jiankong, notice: 'Jiankong was successfully updated.' }
        format.json { render :show, status: :ok, location: @jiankong }
      else
        format.html { render :edit }
        format.json { render json: @jiankong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jiankongs/1
  # DELETE /jiankongs/1.json
  def destroy
    @jiankong.destroy
    respond_to do |format|
      format.html { redirect_to jiankongs_url, notice: 'Jiankong was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jiankong
      @jiankong = Jiankong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jiankong_params
      params.require(:jiankong).permit(:mingzi, :script, :miaoshu, :fuwu_id)
    end
end
