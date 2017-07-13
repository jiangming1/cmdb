class ShujukusqlguanlisController < ApplicationController
  before_action :set_shujukusqlguanli, only: [:show, :edit, :update, :destroy]

  # GET /shujukusqlguanlis
  # GET /shujukusqlguanlis.json
  def index
    @shujukusqlguanlis = Shujukusqlguanli.all
  end

  # GET /shujukusqlguanlis/1
  # GET /shujukusqlguanlis/1.json
  def show
cmd = "ssh root@114.55.36.146 \" echo \\\" "+@shujukusqlguanli.jiaobenneirong+" \\\"|su postgres -c \\\"psql -U postgres -p 5433 laicunba_test\\\" \" "
#cmd.gsub!(/\0/, '')
IO.popen(cmd, :external_encoding=>"utf-8") {|nkf_io|
  @exe = nkf_io.read
}
@cmd=cmd

  end

  # GET /shujukusqlguanlis/new
  def new
    @shujukusqlguanli = Shujukusqlguanli.new
  end

  # GET /shujukusqlguanlis/1/edit
  def edit
  end

  # POST /shujukusqlguanlis
  # POST /shujukusqlguanlis.json
  def create
    @shujukusqlguanli = Shujukusqlguanli.new(shujukusqlguanli_params)

    respond_to do |format|
      if @shujukusqlguanli.save
        format.html { redirect_to @shujukusqlguanli, notice: 'Shujukusqlguanli was successfully created.' }
        format.json { render :show, status: :created, location: @shujukusqlguanli }
      else
        format.html { render :new }
        format.json { render json: @shujukusqlguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shujukusqlguanlis/1
  # PATCH/PUT /shujukusqlguanlis/1.json
  def update
    respond_to do |format|
      if @shujukusqlguanli.update(shujukusqlguanli_params)
        format.html { redirect_to @shujukusqlguanli, notice: 'Shujukusqlguanli was successfully updated.' }
        format.json { render :show, status: :ok, location: @shujukusqlguanli }
      else
        format.html { render :edit }
        format.json { render json: @shujukusqlguanli.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shujukusqlguanlis/1
  # DELETE /shujukusqlguanlis/1.json
  def destroy
    @shujukusqlguanli.destroy
    respond_to do |format|
      format.html { redirect_to shujukusqlguanlis_url, notice: 'Shujukusqlguanli was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shujukusqlguanli
      @shujukusqlguanli = Shujukusqlguanli.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shujukusqlguanli_params
      params.require(:shujukusqlguanli).permit(:jiaobenmingcheng, :jiaobenneirong)
    end
end
