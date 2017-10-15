class QuanxianguanlisController < ApplicationController
  before_action :set_quanxianguanli, only: [:show, :edit, :update, :destroy]

  # GET /quanxianguanlis
  # GET /quanxianguanlis.json
  def index
    @quanxianguanlis = Quanxianguanli.all
  end

  # GET /quanxianguanlis/1
  # GET /quanxianguanlis/1.json
  def show
  end

  # GET /quanxianguanlis/new
  def new
    @quanxianguanli = Quanxianguanli.new
  end

  # GET /quanxianguanlis/1/edit
  def edit
  end

  # POST /quanxianguanlis
  # POST /quanxianguanlis.json
  def create
    @quanxianguanli = Quanxianguanli.new(quanxianguanli_params)

    respond_to do |format|
      if @quanxianguanli.save
        format.html { redirect_to @quanxianguanli, notice: 'Quanxianguanli was successfully created.' }
        format.json { render :show, status: :created, location: @quanxianguanli }
      else
        format.html { render :new }
        format.json { render json: @quanxianguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quanxianguanlis/1
  # PATCH/PUT /quanxianguanlis/1.json
  def update
    respond_to do |format|
      if @quanxianguanli.update(quanxianguanli_params)
        format.html { redirect_to @quanxianguanli, notice: 'Quanxianguanli was successfully updated.' }
        format.json { render :show, status: :ok, location: @quanxianguanli }
      else
        format.html { render :edit }
        format.json { render json: @quanxianguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quanxianguanlis/1
  # DELETE /quanxianguanlis/1.json
  def destroy
    @quanxianguanli.destroy
    respond_to do |format|
      format.html { redirect_to quanxianguanlis_url, notice: 'Quanxianguanli was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quanxianguanli
      @quanxianguanli = Quanxianguanli.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quanxianguanli_params
      params.require(:quanxianguanli).permit(:quanxianmingcheng, :dizhi, :suoshucaidan, :qiyong)
    end
end
