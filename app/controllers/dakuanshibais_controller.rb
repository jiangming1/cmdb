class DakuanshibaisController < ApplicationController
  before_action :set_dakuanshibai, only: [:show, :edit, :update, :destroy]

  # GET /dakuanshibais
  # GET /dakuanshibais.json
  def index
    @dakuanshibais = Dakuanshibai.all
  end

  # GET /dakuanshibais/1
  # GET /dakuanshibais/1.json
  def show
  end

  # GET /dakuanshibais/new
  def new
    @dakuanshibai = Dakuanshibai.new
  end

  # GET /dakuanshibais/1/edit
  def edit
  end

  # POST /dakuanshibais
  # POST /dakuanshibais.json
  def create
    @dakuanshibai = Dakuanshibai.new(dakuanshibai_params)

    respond_to do |format|
      if @dakuanshibai.save
        format.html { redirect_to @dakuanshibai, notice: 'Dakuanshibai was successfully created.' }
        format.json { render :show, status: :created, location: @dakuanshibai }
      else
        format.html { render :new }
        format.json { render json: @dakuanshibai.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dakuanshibais/1
  # PATCH/PUT /dakuanshibais/1.json
  def update
    respond_to do |format|
      if @dakuanshibai.update(dakuanshibai_params)
        format.html { redirect_to @dakuanshibai, notice: 'Dakuanshibai was successfully updated.' }
        format.json { render :show, status: :ok, location: @dakuanshibai }
      else
        format.html { render :edit }
        format.json { render json: @dakuanshibai.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dakuanshibais/1
  # DELETE /dakuanshibais/1.json
  def destroy
    @dakuanshibai.destroy
    respond_to do |format|
      format.html { redirect_to dakuanshibais_url, notice: 'Dakuanshibai was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dakuanshibai
      @dakuanshibai = Dakuanshibai.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dakuanshibai_params
      params.require(:dakuanshibai).permit(:xingming, :shoujihao, :jiekuanjine, :jiekuanlixi, :jiekuanqixian, :jiekuanshijian, :shenheshijian, :shenheren, :caozuo)
    end
end
