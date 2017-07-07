class ShoujisController < ApplicationController
  before_action :set_shouji, only: [:show, :edit, :update, :destroy]

  # GET /shoujis
  # GET /shoujis.json
  def index
    @shoujis = Shouji.all
  end

  # GET /shoujis/1
  # GET /shoujis/1.json
  def show
  end

  # GET /shoujis/new
  def new
    @shouji = Shouji.new
  end

  # GET /shoujis/1/edit
  def edit
  end

  # POST /shoujis
  # POST /shoujis.json
  def create
    @shouji = Shouji.new(shouji_params)

    respond_to do |format|
      if @shouji.save
        format.html { redirect_to @shouji, notice: 'Shouji was successfully created.' }
        format.json { render :show, status: :created, location: @shouji }
      else
        format.html { render :new }
        format.json { render json: @shouji.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shoujis/1
  # PATCH/PUT /shoujis/1.json
  def update
    respond_to do |format|
      if @shouji.update(shouji_params)
        format.html { redirect_to @shouji, notice: 'Shouji was successfully updated.' }
        format.json { render :show, status: :ok, location: @shouji }
      else
        format.html { render :edit }
        format.json { render json: @shouji.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shoujis/1
  # DELETE /shoujis/1.json
  def destroy
    @shouji.destroy
    respond_to do |format|
      format.html { redirect_to shoujis_url, notice: 'Shouji was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shouji
      @shouji = Shouji.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shouji_params
      params.require(:shouji).permit(:ip, :myid, :beizhu)
    end
end
