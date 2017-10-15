class TuiguangsController < ApplicationController
  before_action :set_tuiguang, only: [:show, :edit, :update, :destroy]

  # GET /tuiguangs
  # GET /tuiguangs.json
  def index
    @tuiguangs = Tuiguang.all
  end

  # GET /tuiguangs/1
  # GET /tuiguangs/1.json
  def show
  end

  # GET /tuiguangs/new
  def new
    @tuiguang = Tuiguang.new
  end

  # GET /tuiguangs/1/edit
  def edit
  end

  # POST /tuiguangs
  # POST /tuiguangs.json
  def create
    @tuiguang = Tuiguang.new(tuiguang_params)

    respond_to do |format|
      if @tuiguang.save
        format.html { redirect_to @tuiguang, notice: 'Tuiguang was successfully created.' }
        format.json { render :show, status: :created, location: @tuiguang }
      else
        format.html { render :new }
        format.json { render json: @tuiguang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuiguangs/1
  # PATCH/PUT /tuiguangs/1.json
  def update
    respond_to do |format|
      if @tuiguang.update(tuiguang_params)
        format.html { redirect_to @tuiguang, notice: 'Tuiguang was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuiguang }
      else
        format.html { render :edit }
        format.json { render json: @tuiguang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuiguangs/1
  # DELETE /tuiguangs/1.json
  def destroy
    @tuiguang.destroy
    respond_to do |format|
      format.html { redirect_to tuiguangs_url, notice: 'Tuiguang was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuiguang
      @tuiguang = Tuiguang.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tuiguang_params
      params.require(:tuiguang).permit(:tuiguangfangmingcheng, :dangezhucejianglijin, :dangeziliaowanshanjianglijin, :dangefangkuanjianglijinjine, :dangefangkuangjianglijinbaifenbi, :dangqianzhuangtai)
    end
end
