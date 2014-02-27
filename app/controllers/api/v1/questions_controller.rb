class Api::V1::QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :update, :destroy]
  respond_to :json

  # GET /questions
  def index
    respond_with Question.all
  end

  # GET /questions/1
  def show
    respond_with @question
  end

  # POST /questions
  def create
    @question = Question.new(question_params)

    if @question.save
      respond_with @question, status: :created, location: [:api, :v1, @question]
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /questions/1
  def update
    if @question.update(question_params)
      respond_with @question, status: :ok, location: [:api, :v1, @question]
    else
      render json: @question.errors, status: :unprocessable_entity
    end
  end

  # DELETE /questions/1
  def destroy
    @question.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_question
    @question = Question.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def question_params
    params[:question]
  end
end
