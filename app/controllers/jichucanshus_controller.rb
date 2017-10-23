class JichucanshusController < ApplicationController
  before_action :set_jichucanshu, only: [:show, :edit, :update, :destroy]

  # GET /jichucanshus
  # GET /jichucanshus.json
  def index
    @jichucanshus = Jichucanshu.all
  end

  # GET /jichucanshus/1
  # GET /jichucanshus/1.json
  def show
  end

  # GET /jichucanshus/new
  def new
    @jichucanshu = Jichucanshu.new
  end

  # GET /jichucanshus/1/edit
  def edit
  end

  # POST /jichucanshus
  # POST /jichucanshus.json
  def create
    @jichucanshu = Jichucanshu.new(jichucanshu_params)

    respond_to do |format|
      if @jichucanshu.save
        format.html { redirect_to @jichucanshu, notice: 'Jichucanshu was successfully created.' }
        format.json { render :show, status: :created, location: @jichucanshu }
      else
        format.html { render :new }
        format.json { render json: @jichucanshu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jichucanshus/1
  # PATCH/PUT /jichucanshus/1.json
  def update
    respond_to do |format|
      if @jichucanshu.update(jichucanshu_params)
        format.html { redirect_to @jichucanshu, notice: 'Jichucanshu was successfully updated.' }
        format.json { render :show, status: :ok, location: @jichucanshu }
      else
        format.html { render :edit }
        format.json { render json: @jichucanshu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jichucanshus/1
  # DELETE /jichucanshus/1.json
  def destroy
    @jichucanshu.destroy
    respond_to do |format|
      format.html { redirect_to jichucanshus_url, notice: 'Jichucanshu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jichucanshu
      @jichucanshu = Jichucanshu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jichucanshu_params
      params.require(:jichucanshu).permit(:leixingdaima, :leixingmingcheng, :daimazhi1, :daimazhi2)
    end
end
