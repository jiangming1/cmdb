class CeshirenwuguanlisController < ApplicationController
  before_action :set_ceshirenwuguanli, only: [:show, :edit, :update, :destroy]

  # GET /ceshirenwuguanlis
  # GET /ceshirenwuguanlis.json
  def index
    @ceshirenwuguanlis = Ceshirenwuguanli.all
  end

  # GET /ceshirenwuguanlis/1
  # GET /ceshirenwuguanlis/1.json
  def show
  end

  # GET /ceshirenwuguanlis/new
  def new
    @ceshirenwuguanli = Ceshirenwuguanli.new
  end

  # GET /ceshirenwuguanlis/1/edit
  def edit
  end

  # POST /ceshirenwuguanlis
  # POST /ceshirenwuguanlis.json
  def create
    @ceshirenwuguanli = Ceshirenwuguanli.new(ceshirenwuguanli_params)

    respond_to do |format|
      if @ceshirenwuguanli.save
        format.html { redirect_to @ceshirenwuguanli, notice: 'Ceshirenwuguanli was successfully created.' }
        format.json { render :show, status: :created, location: @ceshirenwuguanli }
      else
        format.html { render :new }
        format.json { render json: @ceshirenwuguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ceshirenwuguanlis/1
  # PATCH/PUT /ceshirenwuguanlis/1.json
  def update
    respond_to do |format|
      if @ceshirenwuguanli.update(ceshirenwuguanli_params)
        format.html { redirect_to @ceshirenwuguanli, notice: 'Ceshirenwuguanli was successfully updated.' }
        format.json { render :show, status: :ok, location: @ceshirenwuguanli }
      else
        format.html { render :edit }
        format.json { render json: @ceshirenwuguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceshirenwuguanlis/1
  # DELETE /ceshirenwuguanlis/1.json
  def destroy
    @ceshirenwuguanli.destroy
    respond_to do |format|
      format.html { redirect_to ceshirenwuguanlis_url, notice: 'Ceshirenwuguanli was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ceshirenwuguanli
      @ceshirenwuguanli = Ceshirenwuguanli.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ceshirenwuguanli_params
      params.require(:ceshirenwuguanli).permit(:ceshileixing, :ceshixiang, :jiaobenmingcheng, :chuangjianshijian, :zhuangtai, :ceshijieguo)
    end
end
