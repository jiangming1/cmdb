class ShuabangsController < ApplicationController
  before_action :set_shuabang, only: [:show, :edit, :update, :destroy]

  # GET /shuabangs
  # GET /shuabangs.json
  def index
    @shuabangs = Shuabang.all
  end

  # GET /shuabangs/1
  # GET /shuabangs/1.json
  def show
  end

  # GET /shuabangs/new
  def new
    @shuabang = Shuabang.new
  end

  # GET /shuabangs/1/edit
  def edit
  end

  # POST /shuabangs
  # POST /shuabangs.json
  def create
    @shuabang = Shuabang.new(shuabang_params)

    respond_to do |format|
      if @shuabang.save
        format.html { redirect_to @shuabang, notice: 'Shuabang was successfully created.' }
        format.json { render :show, status: :created, location: @shuabang }
      else
        format.html { render :new }
        format.json { render json: @shuabang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shuabangs/1
  # PATCH/PUT /shuabangs/1.json
  def update
    respond_to do |format|
      if @shuabang.update(shuabang_params)
        format.html { redirect_to @shuabang, notice: 'Shuabang was successfully updated.' }
        format.json { render :show, status: :ok, location: @shuabang }
      else
        format.html { render :edit }
        format.json { render json: @shuabang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shuabangs/1
  # DELETE /shuabangs/1.json
  def destroy
    @shuabang.destroy
    respond_to do |format|
      format.html { redirect_to shuabangs_url, notice: 'Shuabang was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shuabang
      @shuabang = Shuabang.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shuabang_params
      params.require(:shuabang).permit(:appmingzi, :guanjianci, :laopaiming, :paiming, :appleshuliang, :shuabangshijian, :shangshengshijian, :beizhu)
    end
end
