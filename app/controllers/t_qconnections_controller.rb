class TQconnectionsController < ApplicationController
  before_action :set_t_qconnection, only: [:show, :edit, :update, :destroy]

  # GET /t_qconnections
  # GET /t_qconnections.json
  def index
    @t_qconnections = TQconnection.all
  end

  # GET /t_qconnections/1
  # GET /t_qconnections/1.json
  def show
  end

  # GET /t_qconnections/new
  def new
    @t_qconnection = TQconnection.new
  end

  # GET /t_qconnections/1/edit
  def edit
  end

  # POST /t_qconnections
  # POST /t_qconnections.json
  def create
    @t_qconnection = TQconnection.new(t_qconnection_params)

    respond_to do |format|
      if @t_qconnection.save
        format.html { redirect_to @t_qconnection, notice: 'T qconnection was successfully created.' }
        format.json { render :show, status: :created, location: @t_qconnection }
      else
        format.html { render :new }
        format.json { render json: @t_qconnection.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /t_qconnections/1
  # PATCH/PUT /t_qconnections/1.json
  def update
    respond_to do |format|
      if @t_qconnection.update(t_qconnection_params)
        format.html { redirect_to @t_qconnection, notice: 'T qconnection was successfully updated.' }
        format.json { render :show, status: :ok, location: @t_qconnection }
      else
        format.html { render :edit }
        format.json { render json: @t_qconnection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /t_qconnections/1
  # DELETE /t_qconnections/1.json
  def destroy
    @t_qconnection.destroy
    respond_to do |format|
      format.html { redirect_to t_qconnections_url, notice: 'T qconnection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_t_qconnection
      @t_qconnection = TQconnection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def t_qconnection_params
      params.require(:t_qconnection).permit(:test_id, :question_id)
    end
end
