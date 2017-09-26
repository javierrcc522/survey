require('rspec')
require('pg')
require('pry')
require('spec_helper')
require('survey')
require('question')


describe(Question) do
  describe("#survey") do
    it("tells what survey the question belongs to") do
      test_survey = Survey.create({:description => "cat survey"})
      test_question = Question.create({:question => "cat question", :survey_id => test_survey.id})

      expect(test_question.survey_id()).to(eq(test_survey.id))
    end
  end
end
