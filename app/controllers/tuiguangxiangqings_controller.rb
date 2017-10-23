class TuiguangxiangqingsController < ApplicationController
  before_action :set_tuiguangxiangqing, only: [:show, :edit, :update, :destroy]

  # GET /tuiguangxiangqings
  # GET /tuiguangxiangqings.json
  def index
    @tuiguangxiangqings = Tuiguangxiangqing.all
  end

  # GET /tuiguangxiangqings/1
  # GET /tuiguangxiangqings/1.json
  def show
  end

  # GET /tuiguangxiangqings/new
  def new
    @tuiguangxiangqing = Tuiguangxiangqing.new
  end

  # GET /tuiguangxiangqings/1/edit
  def edit
  end

  # POST /tuiguangxiangqings
  # POST /tuiguangxiangqings.json
  def create
    @tuiguangxiangqing = Tuiguangxiangqing.new(tuiguangxiangqing_params)

    respond_to do |format|
      if @tuiguangxiangqing.save
        format.html { redirect_to @tuiguangxiangqing, notice: 'Tuiguangxiangqing was successfully created.' }
        format.json { render :show, status: :created, location: @tuiguangxiangqing }
      else
        format.html { render :new }
        format.json { render json: @tuiguangxiangqing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tuiguangxiangqings/1
  # PATCH/PUT /tuiguangxiangqings/1.json
  def update
    respond_to do |format|
      if @tuiguangxiangqing.update(tuiguangxiangqing_params)
        format.html { redirect_to @tuiguangxiangqing, notice: 'Tuiguangxiangqing was successfully updated.' }
        format.json { render :show, status: :ok, location: @tuiguangxiangqing }
      else
        format.html { render :edit }
        format.json { render json: @tuiguangxiangqing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tuiguangxiangqings/1
  # DELETE /tuiguangxiangqings/1.json
  def destroy
    @tuiguangxiangqing.destroy
    respond_to do |format|
      format.html { redirect_to tuiguangxiangqings_url, notice: 'Tuiguangxiangqing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tuiguangxiangqing
      @tuiguangxiangqing = Tuiguangxiangqing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tuiguangxiangqing_params
      params.require(:tuiguangxiangqing).permit(:tuiguangmingcheng, :zhuceshu, :shenqingshu, :fangkuanshu, :fangkuanjine, :tongjiriqi, :zuihoushuaxinshijian)
    end
end
