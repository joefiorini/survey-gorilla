class AddSurveyToQuestions < ActiveRecord::Migration
  def change
    add_reference :questions, :survey, index: true
  end
end
