class Changyongzuoye1sController < ApplicationController
  before_action :set_changyongzuoye1, only: [:show, :edit, :update, :destroy]

  # GET /changyongzuoye1s
  # GET /changyongzuoye1s.json
  def index
    @changyongzuoye1s = Changyongzuoye1.all
  end

  # GET /changyongzuoye1s/1
  # GET /changyongzuoye1s/1.json
  def show
       cmd = "sshpass -p \"7JZS5aEF1N1SnmlV4uyk\" ssh 114.55.36.146  'su postgres -c \"psql -U postgres -p 5433 laicunba_test\"'<<!
▸ tmp/                         |"+@zuoye.jiaobenneirong+"
▸ vendor/                      |!"
  a.sh                         |cmd.gsub!(/\0/, '')
  config.ru                    |IO.popen(cmd, :external_encoding=>"utf-8") {|nkf_io|
  Gemfile                      |          @exe = nkf_io.read
  Gemfile.lock                 |}
  nohup.out                    |     @fanhui=cmd

  end

  # GET /changyongzuoye1s/new
  def new
    @changyongzuoye1 = Changyongzuoye1.new
  end

  # GET /changyongzuoye1s/1/edit
  def edit
  end

  # POST /changyongzuoye1s
  # POST /changyongzuoye1s.json
  def create
    @changyongzuoye1 = Changyongzuoye1.new(changyongzuoye1_params)

    respond_to do |format|
      if @changyongzuoye1.save
        format.html { redirect_to @changyongzuoye1, notice: 'Changyongzuoye1 was successfully created.' }
        format.json { render :show, status: :created, location: @changyongzuoye1 }
      else
        format.html { render :new }
        format.json { render json: @changyongzuoye1.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /changyongzuoye1s/1
  # PATCH/PUT /changyongzuoye1s/1.json
  def update
    respond_to do |format|
      if @changyongzuoye1.update(changyongzuoye1_params)
        format.html { redirect_to @changyongzuoye1, notice: 'Changyongzuoye1 was successfully updated.' }
        format.json { render :show, status: :ok, location: @changyongzuoye1 }
      else
        format.html { render :edit }
        format.json { render json: @changyongzuoye1.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /changyongzuoye1s/1
  # DELETE /changyongzuoye1s/1.json
  def destroy
    @changyongzuoye1.destroy
    respond_to do |format|
      format.html { redirect_to changyongzuoye1s_url, notice: 'Changyongzuoye1 was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_changyongzuoye1
      @changyongzuoye1 = Changyongzuoye1.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def changyongzuoye1_params
      params.require(:changyongzuoye1).permit(:zuoyemingcheng, :fenleibiaoqian, :quanjubianliangshezhi, :buzhoumingcheng, :jiaobenmingcheng, :zhixingzhanghu, :fuwuqishuliang, :jiaobencanshu, :wanchenghouzanting)
    end
end
