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
  @question = @survey.questions() #keeps the questions on the same website
  erb(:survey_info)
end

post("/survey/:id") do
  Question.create({:question => params['question'], :survey_id => params[:id]})
  redirect("/survey/new/#{params[:id]}") #21 id similar redirect to
end

patch("/survey/:id") do
  survey = Survey.find(params[:id])
  description = params['description']
  survey.update({:description => description})
  redirect("/survey/new/#{params[:id]}")
end

delete("/survey/:id") do
  @survey = Survey.find(params[:id])
  @survey.delete
  redirect('/')
end
