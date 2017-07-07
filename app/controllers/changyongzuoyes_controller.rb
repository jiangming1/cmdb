class ChangyongzuoyesController < ApplicationController
  before_action :set_changyongzuoye, only: [:show, :edit, :update, :destroy]

  # GET /changyongzuoyes
  # GET /changyongzuoyes.json
  def index
    @changyongzuoyes = Changyongzuoye.all
  end

  # GET /changyongzuoyes/1
  # GET /changyongzuoyes/1.json
  def show
  end

  # GET /changyongzuoyes/new
  def new
    @changyongzuoye = Changyongzuoye.new
  end

  # GET /changyongzuoyes/1/edit
  def edit
  end

  # POST /changyongzuoyes
  # POST /changyongzuoyes.json
  def create
    @changyongzuoye = Changyongzuoye.new(changyongzuoye_params)

    respond_to do |format|
      if @changyongzuoye.save
        format.html { redirect_to @changyongzuoye, notice: 'Changyongzuoye was successfully created.' }
        format.json { render :show, status: :created, location: @changyongzuoye }
      else
        format.html { render :new }
        format.json { render json: @changyongzuoye.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /changyongzuoyes/1
  # PATCH/PUT /changyongzuoyes/1.json
  def update
    respond_to do |format|
      if @changyongzuoye.update(changyongzuoye_params)
        format.html { redirect_to @changyongzuoye, notice: 'Changyongzuoye was successfully updated.' }
        format.json { render :show, status: :ok, location: @changyongzuoye }
      else
        format.html { render :edit }
        format.json { render json: @changyongzuoye.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /changyongzuoyes/1
  # DELETE /changyongzuoyes/1.json
  def destroy
    @changyongzuoye.destroy
    respond_to do |format|
      format.html { redirect_to changyongzuoyes_url, notice: 'Changyongzuoye was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_changyongzuoye
      @changyongzuoye = Changyongzuoye.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def changyongzuoye_params
      params.require(:changyongzuoye).permit(:zuoyemingchen, :fenleibiaoqian, :quanjubianliangshezhi, :buzhoumingchen, :jiaobenmingchen, :zhixingzhanghu, :fuwuqishu, :jiaobencanshu, :wanchenghouzhanting)
    end
end
