require("sinatra")
require("pry")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("sinatra/activerecord")
require("./lib/survey")
require("./lib/question")
require("pg")

get("/") do
  @survey = Survey.all()
  erb(:index)
end

post("/survey/new") do
  Survey.create({:description => params['description']})
  @survey = Survey.all()
  erb(:index)
end

get("/survey/new/:id") do
  @survey = Survey.find(params[:id])
  @question = Question.all()
  erb(:survey_info)
end

patch("/survey/:id") do
  @survey = Survey.find(params[:id])
  description = params['description']
  @survey.update({:description => description})
  erb(:survey_info)
end
