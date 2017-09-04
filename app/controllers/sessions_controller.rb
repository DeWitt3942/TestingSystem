class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy, :reset, :start, :finish, :next, :prev]
  
  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    if @question_id < @data["answers"].size
      @current_data = @data["answers"][@question_id]
      
    end
  end



  # GET /sessions/new
  def new
    @session = Session.new
  end

  # GET /sessions/1/edit
  def edit
  end



  def next
    update_answer(params[:ans])
    if @data["question"] + 1 < @session.test.questions.size
      @data["question"] = @data["question"] + 1
    end

    @session.data = @data.to_json
    @session.save
    redirect_to @session
  end

  def prev
    update_answer(params[:ans])
    if @data["question"]>0
      @data["question"] = @data["question"] - 1
    end


    @session.data = @data.to_json
    @session.save

    redirect_to @session
  end

  def start
    @session.state = 1
    @session.data = "{ \"question\": 0,  \"answers\": [] }"
    @session.save
    redirect_to @session

  end

  def finish
    update_answer(params[:ans])
    while @data["answers"].size < @session.test.questions.size
      @data["answers"].push ""
    end


    @session.data = @data.to_json
    @session.state = 2

    @session.save
    @session.score = @session.calculate_score
    @session.save


    redirect_to @session

  end
  def reset
    @session.state = 0
    @session.save
    redirect_to @session

  end
  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)

    respond_to do |format|
      if @session.save
        format.html { redirect_to @session, notice: 'Session was successfully created.' }
        format.json { render :show, status: :created, location: @session }
      else
        format.html { render :new }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def update_answer(ans)
      ans_data = ans
      if (@question_id < @data["answers"].size)
        @data["answers"][@question_id] = ans_data
      else
        @data["answers"].push ans_data
      end
      
    end
    def set_session
      @session = Session.find(params[:id])
      @data = JSON.parse @session.data
      @question_id = @data["question"]
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:id, :user_id, :test_id, :ans)
    end
end
