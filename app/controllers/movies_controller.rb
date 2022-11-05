class MoviesController < ApplicationController

  def index
    @list_of_movies = Movie.all
    @list_of_directors = Director.all
  render({:template => "movie_templates/index.html.erb"})
  end

  def movie_details
    current_id = params.fetch("an_id")
    @the_movie = Movie.where({:id => current_id}).first
    @movie_director = Director.where({:id => @the_movie.director_id}).first

    render({:template => "movie_templates/show.html.erb"})
  end

end
