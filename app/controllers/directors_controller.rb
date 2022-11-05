class DirectorsController < ApplicationController

def index
  @list_of_directors = Director.all
render({:template => "director_templates/index.html.erb"})
end

def wisest
  @list_of_directors = Director.all
  @oldest_director = @list_of_directors.where.not({:dob => nil}).order(:dob).first.name
  @oldest_director_dob = @list_of_directors.order(:dob).where.not({:dob => nil}).first.dob
render({:template => "director_templates/eldest.html.erb"})
end

def least_wise
  @list_of_directors = Director.all
  @youngest_director = @list_of_directors.where.not({:dob => nil}).order(:dob).last.name
  @youngest_director_dob = @list_of_directors.order(:dob).where.not({:dob => nil}).last.dob
render({:template => "director_templates/youngest.html.erb"})
end

def director_details
current_id = params.fetch("an_id")
@the_director = Director.where({:id => current_id}).first
@filmography = Movie.where({:director_id => @the_director.id})

render({:template => "director_templates/show.html.erb"})
end

end
