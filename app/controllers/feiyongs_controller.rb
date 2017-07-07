class FeiyongsController < ApplicationController
  before_action :set_feiyong, only: [:show, :edit, :update, :destroy]

  # GET /feiyongs
  # GET /feiyongs.json
  def index
    @feiyongs = Feiyong.all
  end

  # GET /feiyongs/1
  # GET /feiyongs/1.json
  def show
  end

  # GET /feiyongs/new
  def new
    @feiyong = Feiyong.new
  end

  # GET /feiyongs/1/edit
  def edit
  end

  # POST /feiyongs
  # POST /feiyongs.json
  def create
    @feiyong = Feiyong.new(feiyong_params)

    respond_to do |format|
      if @feiyong.save
        format.html { redirect_to @feiyong, notice: 'Feiyong was successfully created.' }
        format.json { render :show, status: :created, location: @feiyong }
      else
        format.html { render :new }
        format.json { render json: @feiyong.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /feiyongs/1
  # PATCH/PUT /feiyongs/1.json
  def update
    respond_to do |format|
      if @feiyong.update(feiyong_params)
        format.html { redirect_to @feiyong, notice: 'Feiyong was successfully updated.' }
        format.json { render :show, status: :ok, location: @feiyong }
      else
        format.html { render :edit }
        format.json { render json: @feiyong.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feiyongs/1
  # DELETE /feiyongs/1.json
  def destroy
    @feiyong.destroy
    respond_to do |format|
      format.html { redirect_to feiyongs_url, notice: 'Feiyong was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feiyong
      @feiyong = Feiyong.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def feiyong_params
      params.require(:feiyong).permit(:mingzi, :jine, :miaoshu)
    end
end
