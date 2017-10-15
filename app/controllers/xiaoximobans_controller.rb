class XiaoximobansController < ApplicationController
  before_action :set_xiaoximoban, only: [:show, :edit, :update, :destroy]

  # GET /xiaoximobans
  # GET /xiaoximobans.json
  def index
    @xiaoximobans = Xiaoximoban.all
  end

  # GET /xiaoximobans/1
  # GET /xiaoximobans/1.json
  def show
  end

  # GET /xiaoximobans/new
  def new
    @xiaoximoban = Xiaoximoban.new
  end

  # GET /xiaoximobans/1/edit
  def edit
  end

  # POST /xiaoximobans
  # POST /xiaoximobans.json
  def create
    @xiaoximoban = Xiaoximoban.new(xiaoximoban_params)

    respond_to do |format|
      if @xiaoximoban.save
        format.html { redirect_to @xiaoximoban, notice: 'Xiaoximoban was successfully created.' }
        format.json { render :show, status: :created, location: @xiaoximoban }
      else
        format.html { render :new }
        format.json { render json: @xiaoximoban.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /xiaoximobans/1
  # PATCH/PUT /xiaoximobans/1.json
  def update
    respond_to do |format|
      if @xiaoximoban.update(xiaoximoban_params)
        format.html { redirect_to @xiaoximoban, notice: 'Xiaoximoban was successfully updated.' }
        format.json { render :show, status: :ok, location: @xiaoximoban }
      else
        format.html { render :edit }
        format.json { render json: @xiaoximoban.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /xiaoximobans/1
  # DELETE /xiaoximobans/1.json
  def destroy
    @xiaoximoban.destroy
    respond_to do |format|
      format.html { redirect_to xiaoximobans_url, notice: 'Xiaoximoban was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_xiaoximoban
      @xiaoximoban = Xiaoximoban.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def xiaoximoban_params
      params.require(:xiaoximoban).permit(:bianma, :biaoti, :xiaoxineirong)
    end
end
