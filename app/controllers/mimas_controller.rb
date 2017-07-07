class MimasController < ApplicationController
  before_action :set_mima, only: [:show, :edit, :update, :destroy]

  # GET /mimas
  # GET /mimas.json
  def index
    @mimas = Mima.all
  end

  # GET /mimas/1
  # GET /mimas/1.json
  def show
  end

  # GET /mimas/new
  def new
    @mima = Mima.new
  end

  # GET /mimas/1/edit
  def edit
  end

  # POST /mimas
  # POST /mimas.json
  def create
    @mima = Mima.new(mima_params)

    respond_to do |format|
      if @mima.save
        format.html { redirect_to @mima, notice: 'Mima was successfully created.' }
        format.json { render :show, status: :created, location: @mima }
      else
        format.html { render :new }
        format.json { render json: @mima.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mimas/1
  # PATCH/PUT /mimas/1.json
  def update
    respond_to do |format|
      if @mima.update(mima_params)
        format.html { redirect_to @mima, notice: 'Mima was successfully updated.' }
        format.json { render :show, status: :ok, location: @mima }
      else
        format.html { render :edit }
        format.json { render json: @mima.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mimas/1
  # DELETE /mimas/1.json
  def destroy
    @mima.destroy
    respond_to do |format|
      format.html { redirect_to mimas_url, notice: 'Mima was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mima
      @mima = Mima.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mima_params
      params.require(:mima).permit(:mingzi, :mima, :miaoshu)
    end
end
