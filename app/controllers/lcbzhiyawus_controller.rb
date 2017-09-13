class LcbzhiyawusController < ApplicationController
  before_action :set_lcbzhiyawu, only: [:show, :edit, :update, :destroy]

  # GET /lcbzhiyawus
  # GET /lcbzhiyawus.json
  def index
    @lcbzhiyawus = Lcbzhiyawu.all
  end

  # GET /lcbzhiyawus/1
  # GET /lcbzhiyawus/1.json
  def show
  end

  # GET /lcbzhiyawus/new
  def new
    @lcbzhiyawu = Lcbzhiyawu.new
  end

  # GET /lcbzhiyawus/1/edit
  def edit
  end

  # POST /lcbzhiyawus
  # POST /lcbzhiyawus.json
  def create
    @lcbzhiyawu = Lcbzhiyawu.new(lcbzhiyawu_params)

    respond_to do |format|
      if @lcbzhiyawu.save
        format.html { redirect_to @lcbzhiyawu, notice: 'Lcbzhiyawu was successfully created.' }
        format.json { render :show, status: :created, location: @lcbzhiyawu }
      else
        format.html { render :new }
        format.json { render json: @lcbzhiyawu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lcbzhiyawus/1
  # PATCH/PUT /lcbzhiyawus/1.json
  def update
    respond_to do |format|
      if @lcbzhiyawu.update(lcbzhiyawu_params)
        format.html { redirect_to @lcbzhiyawu, notice: 'Lcbzhiyawu was successfully updated.' }
        format.json { render :show, status: :ok, location: @lcbzhiyawu }
      else
        format.html { render :edit }
        format.json { render json: @lcbzhiyawu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lcbzhiyawus/1
  # DELETE /lcbzhiyawus/1.json
  def destroy
    @lcbzhiyawu.destroy
    respond_to do |format|
      format.html { redirect_to lcbzhiyawus_url, notice: 'Lcbzhiyawu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lcbzhiyawu
      @lcbzhiyawu = Lcbzhiyawu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lcbzhiyawu_params
      params.require(:lcbzhiyawu).permit(:zhuangtai, :mubiaojine, :mujijine, :lilv, :cunkuanqixian, :mingcheng, :zuixiaoine)
    end
end
