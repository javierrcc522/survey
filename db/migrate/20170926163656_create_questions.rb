class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table(:questions) do |question|
      question.column(:question, :string)
      question.column(:survey_id, :integer)

      question.timestamps()
    end
  end
end
