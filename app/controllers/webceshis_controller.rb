class WebceshisController < ApplicationController
  before_action :set_webceshi, only: [:show, :edit, :update, :destroy]

  # GET /webceshis
  # GET /webceshis.json
  def index
    @webceshis = Webceshi.all
  end

  # GET /webceshis/1
  # GET /webceshis/1.json
  def show
  File.open("tmp/temp","w") do |file|
    file.puts @webceshi.jiaoben
  end
  
  @cmd = "scp tmp/temp Administrator@119.29.242.173:/cygdrive/c/temp.py&&ssh -p 22 -tt Administrator@119.29.242.173 'cmd /c python3 c:/temp.py'"
  @cmd.gsub!(/\0/, '')
  IO.popen(@cmd, :external_encoding=>"utf-8") {|nkf_io|
  @exe = nkf_io.read.force_encoding("utf-8")

  }
  end

  # GET /webceshis/new
  def new
    @webceshi = Webceshi.new
  end

  # GET /webceshis/1/edit
  def edit
  end

  # POST /webceshis
  # POST /webceshis.json
  def create
    @webceshi = Webceshi.new(webceshi_params)

    respond_to do |format|
      if @webceshi.save
        format.html { redirect_to @webceshi, notice: 'Webceshi was successfully created.' }
        format.json { render :show, status: :created, location: @webceshi }
      else
        format.html { render :new }
        format.json { render json: @webceshi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /webceshis/1
  # PATCH/PUT /webceshis/1.json
  def update
    respond_to do |format|
      if @webceshi.update(webceshi_params)
        format.html { redirect_to @webceshi, notice: 'Webceshi was successfully updated.' }
        format.json { render :show, status: :ok, location: @webceshi }
      else
        format.html { render :edit }
        format.json { render json: @webceshi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /webceshis/1
  # DELETE /webceshis/1.json
  def destroy
    @webceshi.destroy
    respond_to do |format|
      format.html { redirect_to webceshis_url, notice: 'Webceshi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_webceshi
      @webceshi = Webceshi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def webceshi_params
      params.require(:webceshi).permit(:mingcheng, :jiaoben)
    end
end
