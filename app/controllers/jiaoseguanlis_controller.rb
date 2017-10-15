class JiaoseguanlisController < ApplicationController
  before_action :set_jiaoseguanli, only: [:show, :edit, :update, :destroy]

  # GET /jiaoseguanlis
  # GET /jiaoseguanlis.json
  def index
    @jiaoseguanlis = Jiaoseguanli.all
  end

  # GET /jiaoseguanlis/1
  # GET /jiaoseguanlis/1.json
  def show
  end

  # GET /jiaoseguanlis/new
  def new
    @jiaoseguanli = Jiaoseguanli.new
  end

  # GET /jiaoseguanlis/1/edit
  def edit
  end

  # POST /jiaoseguanlis
  # POST /jiaoseguanlis.json
  def create
    @jiaoseguanli = Jiaoseguanli.new(jiaoseguanli_params)

    respond_to do |format|
      if @jiaoseguanli.save
        format.html { redirect_to @jiaoseguanli, notice: 'Jiaoseguanli was successfully created.' }
        format.json { render :show, status: :created, location: @jiaoseguanli }
      else
        format.html { render :new }
        format.json { render json: @jiaoseguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jiaoseguanlis/1
  # PATCH/PUT /jiaoseguanlis/1.json
  def update
    respond_to do |format|
      if @jiaoseguanli.update(jiaoseguanli_params)
        format.html { redirect_to @jiaoseguanli, notice: 'Jiaoseguanli was successfully updated.' }
        format.json { render :show, status: :ok, location: @jiaoseguanli }
      else
        format.html { render :edit }
        format.json { render json: @jiaoseguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jiaoseguanlis/1
  # DELETE /jiaoseguanlis/1.json
  def destroy
    @jiaoseguanli.destroy
    respond_to do |format|
      format.html { redirect_to jiaoseguanlis_url, notice: 'Jiaoseguanli was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jiaoseguanli
      @jiaoseguanli = Jiaoseguanli.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jiaoseguanli_params
      params.require(:jiaoseguanli).permit(:jiaosedaima, :jiaosemingcheng, :suoshuquanxian, :qiyong)
    end
end
