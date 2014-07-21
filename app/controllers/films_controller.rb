require 'imdb'

class FilmsController < ApplicationController

 def index
  @films = Films.last
 end

 def create
  title = params['search']['search']
  search = Imdb::Search.new(title)
  movie_id = search.movies.first.id
  movie = Imdb::Movie.new(movie_id)
  @films = Films.create(:title => movie.title, :poster_url => movie.poster, :actor_id => movie.cast_member_ids.first)
  redirect_to '/films'
 end

 # def show
 #  @film = params['id']
 #  @film = Films.find_by(:id => @film)
 # end

end