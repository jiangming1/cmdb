class PeizhiguanlisController < ApplicationController
  before_action :set_peizhiguanli, only: [:show, :edit, :update, :destroy]

  # GET /peizhiguanlis
  # GET /peizhiguanlis.json
  def index
    @peizhiguanlis = Peizhiguanli.all
  end

  # GET /peizhiguanlis/1
  # GET /peizhiguanlis/1.json
  def show
  end

  # GET /peizhiguanlis/new
  def new
    @peizhiguanli = Peizhiguanli.new
  end

  # GET /peizhiguanlis/1/edit
  def edit
  end

  # POST /peizhiguanlis
  # POST /peizhiguanlis.json
  def create
    @peizhiguanli = Peizhiguanli.new(peizhiguanli_params)

    respond_to do |format|
      if @peizhiguanli.save
        format.html { redirect_to @peizhiguanli, notice: 'Peizhiguanli was successfully created.' }
        format.json { render :show, status: :created, location: @peizhiguanli }
      else
        format.html { render :new }
        format.json { render json: @peizhiguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /peizhiguanlis/1
  # PATCH/PUT /peizhiguanlis/1.json
  def update
    respond_to do |format|
      if @peizhiguanli.update(peizhiguanli_params)
        format.html { redirect_to @peizhiguanli, notice: 'Peizhiguanli was successfully updated.' }
        format.json { render :show, status: :ok, location: @peizhiguanli }
      else
        format.html { render :edit }
        format.json { render json: @peizhiguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /peizhiguanlis/1
  # DELETE /peizhiguanlis/1.json
  def destroy
    @peizhiguanli.destroy
    respond_to do |format|
      format.html { redirect_to peizhiguanlis_url, notice: 'Peizhiguanli was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_peizhiguanli
      @peizhiguanli = Peizhiguanli.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def peizhiguanli_params
      params.require(:peizhiguanli).permit(:mingzi, :zhujijilu, :ip, :script, :miaoshu, :ttl)
    end
end
