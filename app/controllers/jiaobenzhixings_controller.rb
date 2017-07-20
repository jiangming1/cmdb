class JiaobenzhixingsController < ApplicationController
  before_action :set_jiaobenzhixing, only: [:show, :edit, :update, :destroy]

  # GET /jiaobenzhixings
  # GET /jiaobenzhixings.json
  def index
    @jiaobenzhixings = Jiaobenzhixing.all
  end

  # GET /jiaobenzhixings/1
  # GET /jiaobenzhixings/1.json
  def show
  File.open("temp","w") do |file|
    file.puts @jiaobenzhixing.jiaobenneirong
  end
  @cmd=""
  @exe=""
  @jiaobenzhixing.diannaos.each { |diannao|
  puts diannao.ip
    @cmd1="scp temp root@"+diannao.ip+":/root;ssh  -o ConnectTimeout=1 root@"+diannao.ip+" 'bash /root/temp' "
    #cmd.gsub!(/\0/, '')
    IO.popen(@cmd1, :external_encoding=>"utf-8") {|nkf_io|
      @exe1 = nkf_io.read
    }
    @cmd=@cmd+"\r\n"+@cmd1
    @exe=@exe+"\r\n"+@exe1
  }
  end

  # GET /jiaobenzhixings/new
  def new
    @jiaobenzhixing = Jiaobenzhixing.new
  end

  # GET /jiaobenzhixings/1/edit
  def edit
  end

  # POST /jiaobenzhixings
  # POST /jiaobenzhixings.json
  def create
    @jiaobenzhixing = Jiaobenzhixing.new(jiaobenzhixing_params)

    respond_to do |format|
      if @jiaobenzhixing.save
        format.html { redirect_to @jiaobenzhixing, notice: 'Jiaobenzhixing was successfully created.' }
        format.json { render :show, status: :created, location: @jiaobenzhixing }
      else
        format.html { render :new }
        format.json { render json: @jiaobenzhixing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /jiaobenzhixings/1
  # PATCH/PUT /jiaobenzhixings/1.json
  def update
  #site_events = params[:diannaos].flatten
  #puts site_events
    respond_to do |format|
      if @jiaobenzhixing.update(jiaobenzhixing_params)
        format.html { redirect_to @jiaobenzhixing, notice: 'Jiaobenzhixing was successfully updated.' }
        format.json { render :show, status: :ok, location: @jiaobenzhixing }
      else
        format.html { render :edit }
        format.json { render json: @jiaobenzhixing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /jiaobenzhixings/1
  # DELETE /jiaobenzhixings/1.json
  def destroy
    @jiaobenzhixing.destroy
    respond_to do |format|
      format.html { redirect_to jiaobenzhixings_url, notice: 'Jiaobenzhixing was successfully destroyed.' }
      format.json { head :no_content }
    end
  end




  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_jiaobenzhixing
      @jiaobenzhixing = Jiaobenzhixing.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def jiaobenzhixing_params
      params.require(:jiaobenzhixing).permit(:diannaos,:jiaobenmingcheng, :zhixingzhanghu, :mubiaojiqi, :jiaobenneirong, :jiaobencanshu, :chaoshishijian, diannao_ids: [],diannaos_attributes: [:id, :mingzi,:mubiaojiqi_id,:_destroy])
    end
end
