class DnsController < ApplicationController
  before_action :set_dn, only: [:show, :edit, :update, :destroy]

  # GET /dns
  # GET /dns.json
  def index
    @dns = Dn.all
  end

  # GET /dns/1
  # GET /dns/1.json
  def show
  end

  # GET /dns/new
  def new
    @dn = Dn.new
  end

  # GET /dns/1/edit
  def edit
  end

  # POST /dns
  # POST /dns.json
  def create
    @dn = Dn.new(dn_params)

    respond_to do |format|
      if @dn.save
        format.html { redirect_to @dn, notice: 'Dn was successfully created.' }
        format.json { render :show, status: :created, location: @dn }
      else
        format.html { render :new }
        format.json { render json: @dn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dns/1
  # PATCH/PUT /dns/1.json
  def update
    respond_to do |format|
      if @dn.update(dn_params)
        format.html { redirect_to @dn, notice: 'Dn was successfully updated.' }
        format.json { render :show, status: :ok, location: @dn }
      else
        format.html { render :edit }
        format.json { render json: @dn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dns/1
  # DELETE /dns/1.json
  def destroy
    @dn.destroy
    respond_to do |format|
      format.html { redirect_to dns_url, notice: 'Dn was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dn
      @dn = Dn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dn_params
      params.require(:dn).permit(:mingzi, :zhujijilu, :ip, :miaoshu, :ttl)
    end
end
