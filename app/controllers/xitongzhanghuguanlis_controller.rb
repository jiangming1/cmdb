class XitongzhanghuguanlisController < ApplicationController
  before_action :set_xitongzhanghuguanli, only: [:show, :edit, :update, :destroy]

  # GET /xitongzhanghuguanlis
  # GET /xitongzhanghuguanlis.json
  def index
    @xitongzhanghuguanlis = Xitongzhanghuguanli.all
  end

  # GET /xitongzhanghuguanlis/1
  # GET /xitongzhanghuguanlis/1.json
  def show
  end

  # GET /xitongzhanghuguanlis/new
  def new
    @xitongzhanghuguanli = Xitongzhanghuguanli.new
  end

  # GET /xitongzhanghuguanlis/1/edit
  def edit
  end

  # POST /xitongzhanghuguanlis
  # POST /xitongzhanghuguanlis.json
  def create
    @xitongzhanghuguanli = Xitongzhanghuguanli.new(xitongzhanghuguanli_params)

    respond_to do |format|
      if @xitongzhanghuguanli.save
        format.html { redirect_to @xitongzhanghuguanli, notice: 'Xitongzhanghuguanli was successfully created.' }
        format.json { render :show, status: :created, location: @xitongzhanghuguanli }
      else
        format.html { render :new }
        format.json { render json: @xitongzhanghuguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xitongzhanghuguanlis/1
  # PATCH/PUT /xitongzhanghuguanlis/1.json
  def update
    respond_to do |format|
      if @xitongzhanghuguanli.update(xitongzhanghuguanli_params)
        format.html { redirect_to @xitongzhanghuguanli, notice: 'Xitongzhanghuguanli was successfully updated.' }
        format.json { render :show, status: :ok, location: @xitongzhanghuguanli }
      else
        format.html { render :edit }
        format.json { render json: @xitongzhanghuguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xitongzhanghuguanlis/1
  # DELETE /xitongzhanghuguanlis/1.json
  def destroy
    @xitongzhanghuguanli.destroy
    respond_to do |format|
      format.html { redirect_to xitongzhanghuguanlis_url, notice: 'Xitongzhanghuguanli was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xitongzhanghuguanli
    
      @xitongzhanghuguanli = Xitongzhanghuguanli.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xitongzhanghuguanli_params
      params.require(:xitongzhanghuguanli).permit(:xitongzhanghao, :xitongmima)
    end
end
