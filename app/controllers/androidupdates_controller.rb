class AndroidupdatesController < ApplicationController
  before_action :set_androidupdate, only: [:show, :edit, :update, :destroy]

  # GET /androidupdates
  # GET /androidupdates.json
  def index
    @androidupdates = Androidupdate.all
  end

  # GET /androidupdates/1
  # GET /androidupdates/1.json
  def show
  end

  # GET /androidupdates/new
  def new
    @androidupdate = Androidupdate.new
  end

  # GET /androidupdates/1/edit
  def edit
  end

  # POST /androidupdates
  # POST /androidupdates.json
  def create
    @androidupdate = Androidupdate.new(androidupdate_params)

    respond_to do |format|
      if @androidupdate.save
        format.html { redirect_to @androidupdate, notice: 'Androidupdate was successfully created.' }
        format.json { render :show, status: :created, location: @androidupdate }
      else
        format.html { render :new }
        format.json { render json: @androidupdate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /androidupdates/1
  # PATCH/PUT /androidupdates/1.json
  def update
    respond_to do |format|
      if @androidupdate.update(androidupdate_params)
        format.html { redirect_to @androidupdate, notice: 'Androidupdate was successfully updated.' }
        format.json { render :show, status: :ok, location: @androidupdate }
      else
        format.html { render :edit }
        format.json { render json: @androidupdate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /androidupdates/1
  # DELETE /androidupdates/1.json
  def destroy
    @androidupdate.destroy
    respond_to do |format|
      format.html { redirect_to androidupdates_url, notice: 'Androidupdate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_androidupdate
      @androidupdate = Androidupdate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def androidupdate_params
      params.require(:androidupdate).permit(:shichang, :fabushijian, :apkurl, :versioncode, :versionname, :summary)
    end
end
