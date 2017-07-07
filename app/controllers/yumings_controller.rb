class YumingsController < ApplicationController
  before_action :set_yuming, only: [:show, :edit, :update, :destroy]

  # GET /yumings
  # GET /yumings.json
  def index
    @yumings = Yuming.all
  end

  # GET /yumings/1
  # GET /yumings/1.json
  def show
  end

  # GET /yumings/new
  def new
    @yuming = Yuming.new
  end

  # GET /yumings/1/edit
  def edit
  end

  # POST /yumings
  # POST /yumings.json
  def create
    @yuming = Yuming.new(yuming_params)

    respond_to do |format|
      if @yuming.save
        format.html { redirect_to @yuming, notice: 'Yuming was successfully created.' }
        format.json { render :show, status: :created, location: @yuming }
      else
        format.html { render :new }
        format.json { render json: @yuming.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yumings/1
  # PATCH/PUT /yumings/1.json
  def update
    respond_to do |format|
      if @yuming.update(yuming_params)
        format.html { redirect_to @yuming, notice: 'Yuming was successfully updated.' }
        format.json { render :show, status: :ok, location: @yuming }
      else
        format.html { render :edit }
        format.json { render json: @yuming.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yumings/1
  # DELETE /yumings/1.json
  def destroy
    @yuming.destroy
    respond_to do |format|
      format.html { redirect_to yumings_url, notice: 'Yuming was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yuming
      @yuming = Yuming.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yuming_params
      params.require(:yuming).permit(:mingzi, :ip, :miaoshu)
    end
end
