require('rspec')
require('pg')
require('pry')
require('spec_helper')
require('survey')
require('question')


describe(Question) do
  describe("#survey") do
    it("tells which survey it belongs to") do
      test_survey = Survey.create({:description => "cat survey"})
      test_question = Question.create({:question => "cat question", :survey_id => test_survey.id})
      expect(test_survey.questions()).to(eq([test_question]))
    end
  end

  # describe(".not_done") do
  #   it("returns the not done tasks") do
  #     not_done_task1 = Task.create({:description => "gotta do it", :done => false})
  #     not_done_task2 = Task.create({:description => "gotta do it too", :done => false})
  #     not_done_tasks = [not_done_task1, not_done_task2]
  #     done_task = Task.create({:description => "done task", :done => true})
  #     expect(Task.not_done()).to(eq(not_done_tasks))
  #   end
  # end

end
