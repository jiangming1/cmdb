class DizhiguanlisController < ApplicationController
  before_action :set_dizhiguanli, only: [:show, :edit, :update, :destroy]

  # GET /dizhiguanlis
  # GET /dizhiguanlis.json
  def index
    @dizhiguanlis = Dizhiguanli.all
  end

  # GET /dizhiguanlis/1
  # GET /dizhiguanlis/1.json
  def show
  end

  # GET /dizhiguanlis/new
  def new
    @dizhiguanli = Dizhiguanli.new
  end

  # GET /dizhiguanlis/1/edit
  def edit
  end

  # POST /dizhiguanlis
  # POST /dizhiguanlis.json
  def create
    @dizhiguanli = Dizhiguanli.new(dizhiguanli_params)

    respond_to do |format|
      if @dizhiguanli.save
        format.html { redirect_to @dizhiguanli, notice: 'Dizhiguanli was successfully created.' }
        format.json { render :show, status: :created, location: @dizhiguanli }
      else
        format.html { render :new }
        format.json { render json: @dizhiguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dizhiguanlis/1
  # PATCH/PUT /dizhiguanlis/1.json
  def update
    respond_to do |format|
      if @dizhiguanli.update(dizhiguanli_params)
        format.html { redirect_to @dizhiguanli, notice: 'Dizhiguanli was successfully updated.' }
        format.json { render :show, status: :ok, location: @dizhiguanli }
      else
        format.html { render :edit }
        format.json { render json: @dizhiguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dizhiguanlis/1
  # DELETE /dizhiguanlis/1.json
  def destroy
    @dizhiguanli.destroy
    respond_to do |format|
      format.html { redirect_to dizhiguanlis_url, notice: 'Dizhiguanli was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dizhiguanli
      @dizhiguanli = Dizhiguanli.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dizhiguanli_params
      params.require(:dizhiguanli).permit(:daima, :mingcheng, :shangjichengshi, :dengji, :paixu, :pinyin, :jianpin)
    end
end
