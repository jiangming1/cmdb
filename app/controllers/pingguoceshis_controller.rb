class PingguoceshisController < ApplicationController
  before_action :set_pingguoceshi, only: [:show, :edit, :update, :destroy]

  # GET /pingguoceshis
  # GET /pingguoceshis.json
  def index
    @pingguoceshis = Pingguoceshi.all
  end

  # GET /pingguoceshis/1
  # GET /pingguoceshis/1.json
  def show
  File.open("temp","w") do |file|
    file.puts @pingguoceshi.jiaoben
  end
  
  @cmd = "zip -r /root/cmdb/temp.zip /root/cmdb/temp;scp /root/cmdb/temp Administrator@119.29.242.173:/cygdrive/c;ssh -p 22 -tt Administrator@119.29.242.173 'cmd /c python3 c:/taoandroid.py'"
  @cmd.gsub!(/\0/, '')
  IO.popen(@cmd, :external_encoding=>"utf-8") {|nkf_io|
  @exe = nkf_io.read
  }
  end

  # GET /pingguoceshis/new
  def new
    @pingguoceshi = Pingguoceshi.new
  end

  # GET /pingguoceshis/1/edit
  def edit
  end

  # POST /pingguoceshis
  # POST /pingguoceshis.json
  def create
    @pingguoceshi = Pingguoceshi.new(pingguoceshi_params)

    respond_to do |format|
      if @pingguoceshi.save
        format.html { redirect_to @pingguoceshi, notice: 'Pingguoceshi was successfully created.' }
        format.json { render :show, status: :created, location: @pingguoceshi }
      else
        format.html { render :new }
        format.json { render json: @pingguoceshi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pingguoceshis/1
  # PATCH/PUT /pingguoceshis/1.json
  def update
    respond_to do |format|
      if @pingguoceshi.update(pingguoceshi_params)
        format.html { redirect_to @pingguoceshi, notice: 'Pingguoceshi was successfully updated.' }
        format.json { render :show, status: :ok, location: @pingguoceshi }
      else
        format.html { render :edit }
        format.json { render json: @pingguoceshi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pingguoceshis/1
  # DELETE /pingguoceshis/1.json
  def destroy
    @pingguoceshi.destroy
    respond_to do |format|
      format.html { redirect_to pingguoceshis_url, notice: 'Pingguoceshi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pingguoceshi
      @pingguoceshi = Pingguoceshi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pingguoceshi_params
      params.require(:pingguoceshi).permit(:mingcheng, :jiaoben)
    end
end
