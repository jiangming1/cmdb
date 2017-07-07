class FuwusController < ApplicationController
  before_action :set_fuwu, only: [:show, :edit, :update, :destroy]

  # GET /fuwus
  # GET /fuwus.json
  def index
    @fuwus = Fuwu.all
  end

  # GET /fuwus/1
  # GET /fuwus/1.json
  def show
  end

  # GET /fuwus/new
  def new
    @fuwu = Fuwu.new
  end

  # GET /fuwus/1/edit
  def edit
  end

  # POST /fuwus
  # POST /fuwus.json
  def create
    @fuwu = Fuwu.new(fuwu_params)

    respond_to do |format|
      if @fuwu.save
        format.html { redirect_to @fuwu, notice: 'Fuwu was successfully created.' }
        format.json { render :show, status: :created, location: @fuwu }
      else
        format.html { render :new }
        format.json { render json: @fuwu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fuwus/1
  # PATCH/PUT /fuwus/1.json
  def update
    respond_to do |format|
      if @fuwu.update(fuwu_params)
        format.html { redirect_to @fuwu, notice: 'Fuwu was successfully updated.' }
        format.json { render :show, status: :ok, location: @fuwu }
      else
        format.html { render :edit }
        format.json { render json: @fuwu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fuwus/1
  # DELETE /fuwus/1.json
  def destroy
    @fuwu.destroy
    respond_to do |format|
      format.html { redirect_to fuwus_url, notice: 'Fuwu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fuwu
      @fuwu = Fuwu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fuwu_params
      params.require(:fuwu).permit(:mingzi, :svn, :port, :miaoshu, :diannao_id)
    end
end
