class AnzhuoceshisController < ApplicationController
  before_action :set_anzhuoceshi, only: [:show, :edit, :update, :destroy]

  # GET /anzhuoceshis
  # GET /anzhuoceshis.json
  def index
    @anzhuoceshis = Anzhuoceshi.all
  end

  # GET /anzhuoceshis/1
  # GET /anzhuoceshis/1.json
  def show
  File.open("tmp/temp","w") do |file|
    file.puts @anzhuoceshi.jiaoben
  end
  
  #@cmd = "zip -r /root/cmdb/temp.zip /root/cmdb/temp;scp /root/cmdb/temp Administrator@119.29.242.173:/cygdrive/c;ssh -p 22 -tt Administrator@119.29.242.173 'cmd /c python3 c:/taoandroid.py'"
  
  @cmd = "makecab tmp/temp tmp/ls.zip&&scp tmp/ls.zip Administrator@119.29.242.173:/cygdrive/c/temp.zip&&ssh -p 22 -tt Administrator@119.29.242.173 'cmd /c python3 c:/taoandroid.py'"
  
  @cmd.gsub!(/\0/, '')
  IO.popen(@cmd, :external_encoding=>"utf-8") {|nkf_io|
  @exe = nkf_io.read
  }
  end

  # GET /anzhuoceshis/new
  def new
    @anzhuoceshi = Anzhuoceshi.new
  end

  # GET /anzhuoceshis/1/edit
  def edit
  end

  # POST /anzhuoceshis
  # POST /anzhuoceshis.json
  def create
    @anzhuoceshi = Anzhuoceshi.new(anzhuoceshi_params)

    respond_to do |format|
      if @anzhuoceshi.save
        format.html { redirect_to @anzhuoceshi, notice: 'Anzhuoceshi was successfully created.' }
        format.json { render :show, status: :created, location: @anzhuoceshi }
      else
        format.html { render :new }
        format.json { render json: @anzhuoceshi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anzhuoceshis/1
  # PATCH/PUT /anzhuoceshis/1.json
  def update
    respond_to do |format|
      if @anzhuoceshi.update(anzhuoceshi_params)
        format.html { redirect_to @anzhuoceshi, notice: 'Anzhuoceshi was successfully updated.' }
        format.json { render :show, status: :ok, location: @anzhuoceshi }
      else
        format.html { render :edit }
        format.json { render json: @anzhuoceshi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anzhuoceshis/1
  # DELETE /anzhuoceshis/1.json
  def destroy
    @anzhuoceshi.destroy
    respond_to do |format|
      format.html { redirect_to anzhuoceshis_url, notice: 'Anzhuoceshi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anzhuoceshi
      @anzhuoceshi = Anzhuoceshi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anzhuoceshi_params
      params.require(:anzhuoceshi).permit(:mingcheng, :jiaoben)
    end
end
