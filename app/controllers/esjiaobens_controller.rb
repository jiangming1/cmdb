class EsjiaobensController < ApplicationController
  before_action :set_esjiaoben, only: [:show, :edit, :update, :destroy]

  # GET /esjiaobens
  # GET /esjiaobens.json
  def index
    @esjiaobens = Esjiaoben.all
  end

  # GET /esjiaobens/1
  # GET /esjiaobens/1.json
  def show
    regex=/CREATE TABLE (.+) AS/ 
    regex.match(@esjiaoben.jiaobenneirong) 
    biaoming= $1
    puts @esjiaoben.jiaobenneirong
      @cmd = "ssh root@114.55.36.146 \" echo \\\" "+@esjiaoben.jiaobenneirong+" \\\"|su postgres -c \\\"psql -U postgres -p 5433 laicunba_test\\\" \" "
    IO.popen(@cmd, :external_encoding=>"utf-8") {|nkf_io|
      @exe = nkf_io.read
    }
    
    @cmd = "ssh root@114.55.36.146 \" /opt/elasticsearch-jdbc-2.3.4.0/bin/postgresql-1.sh \\\" "+biaoming+" \\\" \" "
    IO.popen(@cmd, :external_encoding=>"utf-8") {|nkf_io|
      @exe = nkf_io.read
    }
  end

  # GET /esjiaobens/new
  def new
    @esjiaoben = Esjiaoben.new
  end

  # GET /esjiaobens/1/edit
  def edit
  end

  # POST /esjiaobens
  # POST /esjiaobens.json
  def create
    @esjiaoben = Esjiaoben.new(esjiaoben_params)

    respond_to do |format|
      if @esjiaoben.save
        format.html { redirect_to @esjiaoben, notice: 'Esjiaoben was successfully created.' }
        format.json { render :show, status: :created, location: @esjiaoben }
      else
        format.html { render :new }
        format.json { render json: @esjiaoben.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /esjiaobens/1
  # PATCH/PUT /esjiaobens/1.json
  def update
    respond_to do |format|
      if @esjiaoben.update(esjiaoben_params)
        format.html { redirect_to @esjiaoben, notice: 'Esjiaoben was successfully updated.' }
        format.json { render :show, status: :ok, location: @esjiaoben }
      else
        format.html { render :edit }
        format.json { render json: @esjiaoben.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /esjiaobens/1
  # DELETE /esjiaobens/1.json
  def destroy
    @esjiaoben.destroy
    respond_to do |format|
      format.html { redirect_to esjiaobens_url, notice: 'Esjiaoben was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_esjiaoben
      @esjiaoben = Esjiaoben.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def esjiaoben_params
      params.require(:esjiaoben).permit(:jiaobenmingcheng, :jiaobenneirong, :beizhu)
    end
end
