class PingguodingshirenwusController < ApplicationController
  before_action :set_pingguodingshirenwu, only: [:show, :edit, :update, :destroy]

  # GET /pingguodingshirenwus
  # GET /pingguodingshirenwus.json
  def index
    @pingguodingshirenwus = Pingguodingshirenwu.all
  end

  # GET /pingguodingshirenwus/1
  # GET /pingguodingshirenwus/1.json
  def show
  end

  # GET /pingguodingshirenwus/new
  def new
    @pingguodingshirenwu = Pingguodingshirenwu.new
  end

  # GET /pingguodingshirenwus/1/edit
  def edit
  end

  # POST /pingguodingshirenwus
  # POST /pingguodingshirenwus.json
  def create
    @pingguodingshirenwu = Pingguodingshirenwu.new(pingguodingshirenwu_params)

    respond_to do |format|
      if @pingguodingshirenwu.save
        format.html { redirect_to @pingguodingshirenwu, notice: 'Pingguodingshirenwu was successfully created.' }
        format.json { render :show, status: :created, location: @pingguodingshirenwu }
      else
        format.html { render :new }
        format.json { render json: @pingguodingshirenwu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pingguodingshirenwus/1
  # PATCH/PUT /pingguodingshirenwus/1.json
  def update
    respond_to do |format|
      if @pingguodingshirenwu.update(pingguodingshirenwu_params)
        format.html { redirect_to @pingguodingshirenwu, notice: 'Pingguodingshirenwu was successfully updated.' }
        format.json { render :show, status: :ok, location: @pingguodingshirenwu }
      else
        format.html { render :edit }
        format.json { render json: @pingguodingshirenwu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pingguodingshirenwus/1
  # DELETE /pingguodingshirenwus/1.json
  def destroy
    @pingguodingshirenwu.destroy
    respond_to do |format|
      format.html { redirect_to pingguodingshirenwus_url, notice: 'Pingguodingshirenwu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pingguodingshirenwu
      @pingguodingshirenwu = Pingguodingshirenwu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pingguodingshirenwu_params
      params.require(:pingguodingshirenwu).permit(:chengxumingcheng, :guanjianci, :dijiming, :beizhu)
    end
end
