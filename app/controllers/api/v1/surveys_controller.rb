class Api::V1::SurveysController < ApplicationController
  before_action :set_survey, only: [:show, :update, :destroy]
  respond_to :json

  # GET /surveys
  def index
    respond_with Survey.all
  end

  # GET /surveys/1
  def show
    respond_with @survey
  end

  # POST /surveys
  def create
    @survey = Survey.new(survey_params)

    if @survey.save
      respond_with @survey, status: :created, location: [:api, :v1, @survey]
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /surveys/1
  def update
    if @survey.update(survey_params)
      respond_with @survey, status: :ok, location: [:api, :v1, @survey]
    else
      render json: @survey.errors, status: :unprocessable_entity
    end
  end

  # DELETE /surveys/1
  def destroy
    @survey.destroy
    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_survey
    @survey = Survey.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def survey_params
    params.require(:survey).permit(:name)
  end
end
