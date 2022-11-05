class ActorsController < ApplicationController

  def index
    @list_of_actors = Actor.all
  render({:template => "actor_templates/index.html.erb"})
  end


  def actor_details
    current_id = params.fetch("an_id")
    @the_actor = Actor.where({:id => current_id}).first
    #@filmography = Movie.where({:actor_id => @the_director.id})
    @roles = Character.where({:actor_id => @the_actor.id})
    @list_of_movies = Movie.all
    @list_of_directors = Director.all
    render({:template => "actor_templates/show.html.erb"})
  end

end
