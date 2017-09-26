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
  @survey = Survey.all
  erb(:index)
end
