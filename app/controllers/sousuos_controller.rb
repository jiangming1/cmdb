class SousuosController < ApplicationController
  before_action :set_sousuo, only: [:show, :edit, :update, :destroy]

  # GET /sousuos
  # GET /sousuos.json
  def index
    @sousuos = Sousuo.all
  end

  # GET /sousuos/1
  # GET /sousuos/1.json
  def show
  end

  # GET /sousuos/new
  def new
    @sousuo = Sousuo.new
  end

  # GET /sousuos/1/edit
  def edit
  end

  # POST /sousuos
  # POST /sousuos.json
  def create
    @sousuo = Sousuo.new(sousuo_params)

    respond_to do |format|
      if @sousuo.save
        format.html { redirect_to @sousuo, notice: 'Sousuo was successfully created.' }
        format.json { render :show, status: :created, location: @sousuo }
      else
        format.html { render :new }
        format.json { render json: @sousuo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sousuos/1
  # PATCH/PUT /sousuos/1.json
  def update
    respond_to do |format|
      if @sousuo.update(sousuo_params)
        format.html { redirect_to @sousuo, notice: 'Sousuo was successfully updated.' }
        format.json { render :show, status: :ok, location: @sousuo }
      else
        format.html { render :edit }
        format.json { render json: @sousuo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sousuos/1
  # DELETE /sousuos/1.json
  def destroy
    @sousuo.destroy
    respond_to do |format|
      format.html { redirect_to sousuos_url, notice: 'Sousuo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sousuo
      @sousuo = Sousuo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sousuo_params
      params.require(:sousuo).permit(:appname, :gongsi, :leixing, :type, :qushi)
    end
end
