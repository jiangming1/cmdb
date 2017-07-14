class CeshijilusController < ApplicationController
  before_action :set_ceshijilu, only: [:show, :edit, :update, :destroy]

  # GET /ceshijilus
  # GET /ceshijilus.json
  def index
    @ceshijilus = Ceshijilu.all
  end

  # GET /ceshijilus/1
  # GET /ceshijilus/1.json
  def show
  end

  # GET /ceshijilus/new
  def new
    @ceshijilu = Ceshijilu.new
  end

  # GET /ceshijilus/1/edit
  def edit
  end

  # POST /ceshijilus
  # POST /ceshijilus.json
  def create
    @ceshijilu = Ceshijilu.new(ceshijilu_params)

    respond_to do |format|
      if @ceshijilu.save
        format.html { redirect_to @ceshijilu, notice: 'Ceshijilu was successfully created.' }
        format.json { render :show, status: :created, location: @ceshijilu }
      else
        format.html { render :new }
        format.json { render json: @ceshijilu.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ceshijilus/1
  # PATCH/PUT /ceshijilus/1.json
  def update
    respond_to do |format|
      if @ceshijilu.update(ceshijilu_params)
        format.html { redirect_to @ceshijilu, notice: 'Ceshijilu was successfully updated.' }
        format.json { render :show, status: :ok, location: @ceshijilu }
      else
        format.html { render :edit }
        format.json { render json: @ceshijilu.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ceshijilus/1
  # DELETE /ceshijilus/1.json
  def destroy
    @ceshijilu.destroy
    respond_to do |format|
      format.html { redirect_to ceshijilus_url, notice: 'Ceshijilu was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ceshijilu
      @ceshijilu = Ceshijilu.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ceshijilu_params
      params.require(:ceshijilu).permit(:mingcheng, :jiaoben, :beizhu)
    end
end
