class MenuindicesController < ApplicationController
  before_action :set_menuindex, only: [:show, :edit, :update, :destroy]

  # GET /menuindices
  # GET /menuindices.json
  def index
    @menuindices = Menuindex.all
  end

  # GET /menuindices/1
  # GET /menuindices/1.json
  def show
  end

  # GET /menuindices/new
  def new
    @menuindex = Menuindex.new
  end

  # GET /menuindices/1/edit
  def edit
  end

  # POST /menuindices
  # POST /menuindices.json
  def create
    @menuindex = Menuindex.new(menuindex_params)

    respond_to do |format|
      if @menuindex.save
        format.html { redirect_to @menuindex, notice: 'Menuindex was successfully created.' }
        format.json { render :show, status: :created, location: @menuindex }
      else
        format.html { render :new }
        format.json { render json: @menuindex.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menuindices/1
  # PATCH/PUT /menuindices/1.json
  def update
    respond_to do |format|
      if @menuindex.update(menuindex_params)
        format.html { redirect_to @menuindex, notice: 'Menuindex was successfully updated.' }
        format.json { render :show, status: :ok, location: @menuindex }
      else
        format.html { render :edit }
        format.json { render json: @menuindex.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menuindices/1
  # DELETE /menuindices/1.json
  def destroy
    @menuindex.destroy
    respond_to do |format|
      format.html { redirect_to menuindices_url, notice: 'Menuindex was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menuindex
      @menuindex = Menuindex.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menuindex_params
      params.require(:menuindex).permit(:mingzi, :url)
    end
end
