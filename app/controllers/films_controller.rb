require 'imdb'

class FilmsController < ApplicationController
 before_action :authenticate_user!

 def index
  @films = Films.all
 end

 def create
  title = params['search']['search']
  search = Imdb::Search.new(title)
  movie_id = search.movies.first.id
  movie = Imdb::Movie.new(movie_id)
  @films = Films.create(:title => movie.title, :year => movie.year, :runtime => movie.length, :ratings => movie.rating, :votes => movie.votes, :poster => movie.poster, :actors => movie.cast_member_ids.take(3).join(","))
  session[:first_added] = true
 end
end