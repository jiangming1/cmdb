class DiannaosController < ApplicationController
  before_action :set_diannao, only: [:show, :edit, :update, :destroy]

  # GET /diannaos
  # GET /diannaos.json
  def index
    @diannaos = Diannao.all
  end

  # GET /diannaos/1
  # GET /diannaos/1.json
  def show
  end

  # GET /diannaos/new
  def new
    @diannao = Diannao.new
  end

  # GET /diannaos/1/edit
  def edit
  end

  # POST /diannaos
  # POST /diannaos.json
  def create
    @diannao = Diannao.new(diannao_params)

    respond_to do |format|
      if @diannao.save
        format.html { redirect_to @diannao, notice: 'Diannao was successfully created.' }
        format.json { render :show, status: :created, location: @diannao }
      else
        format.html { render :new }
        format.json { render json: @diannao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /diannaos/1
  # PATCH/PUT /diannaos/1.json
  def update
    respond_to do |format|
      if @diannao.update(diannao_params)
        format.html { redirect_to @diannao, notice: 'Diannao was successfully updated.' }
        format.json { render :show, status: :ok, location: @diannao }
      else
        format.html { render :edit }
        format.json { render json: @diannao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diannaos/1
  # DELETE /diannaos/1.json
  def destroy
    @diannao.destroy
    respond_to do |format|
      format.html { redirect_to diannaos_url, notice: 'Diannao was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_diannao
      @diannao = Diannao.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def diannao_params
      params.require(:diannao).permit(:mingzi, :ip, :neiip, :yonghu, :mima, :pubkey, :miaoshu, jiaobenzhixings_attributes: [:id, :name])
    end
end
