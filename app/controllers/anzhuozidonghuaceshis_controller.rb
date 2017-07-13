class AnzhuozidonghuaceshisController < ApplicationController
  before_action :set_anzhuozidonghuaceshi, only: [:show, :edit, :update, :destroy]

  # GET /anzhuozidonghuaceshis
  # GET /anzhuozidonghuaceshis.json
  def index
    @anzhuozidonghuaceshis = Anzhuozidonghuaceshi.all
  end

  # GET /anzhuozidonghuaceshis/1
  # GET /anzhuozidonghuaceshis/1.json
  def show
  end

  # GET /anzhuozidonghuaceshis/new
  def new
    @anzhuozidonghuaceshi = Anzhuozidonghuaceshi.new
  end

  # GET /anzhuozidonghuaceshis/1/edit
  def edit
  end

  # POST /anzhuozidonghuaceshis
  # POST /anzhuozidonghuaceshis.json
  def create
    @anzhuozidonghuaceshi = Anzhuozidonghuaceshi.new(anzhuozidonghuaceshi_params)

    respond_to do |format|
      if @anzhuozidonghuaceshi.save
        format.html { redirect_to @anzhuozidonghuaceshi, notice: 'Anzhuozidonghuaceshi was successfully created.' }
        format.json { render :show, status: :created, location: @anzhuozidonghuaceshi }
      else
        format.html { render :new }
        format.json { render json: @anzhuozidonghuaceshi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /anzhuozidonghuaceshis/1
  # PATCH/PUT /anzhuozidonghuaceshis/1.json
  def update
    respond_to do |format|
      if @anzhuozidonghuaceshi.update(anzhuozidonghuaceshi_params)
        format.html { redirect_to @anzhuozidonghuaceshi, notice: 'Anzhuozidonghuaceshi was successfully updated.' }
        format.json { render :show, status: :ok, location: @anzhuozidonghuaceshi }
      else
        format.html { render :edit }
        format.json { render json: @anzhuozidonghuaceshi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /anzhuozidonghuaceshis/1
  # DELETE /anzhuozidonghuaceshis/1.json
  def destroy
    @anzhuozidonghuaceshi.destroy
    respond_to do |format|
      format.html { redirect_to anzhuozidonghuaceshis_url, notice: 'Anzhuozidonghuaceshi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_anzhuozidonghuaceshi
      @anzhuozidonghuaceshi = Anzhuozidonghuaceshi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def anzhuozidonghuaceshi_params
      params.require(:anzhuozidonghuaceshi).permit(:mingcheng, :jiaoben)
    end
end
