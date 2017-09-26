class CreateSurveys < ActiveRecord::Migration[5.1]
  def change
    create_table(:surveys) do |survey|
      survey.column(:description, :string)

      survey.timestamps()
    end
  end
end
