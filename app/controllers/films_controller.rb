require 'imdb'

class FilmsController < ApplicationController

 def index
  @films = Films.all
 end

 def create
  title = params['search']['search']
  search = Imdb::Search.new(title)
  movie_id = search.movies.first.id
  movie = Imdb::Movie.new(movie_id)
  @films = Films.create(:title => movie.title, :year => movie.year, :runtime => movie.length, :ratings => movie.rating, :votes => movie.votes, :poster => movie.poster, :actor => movie.cast_member_ids.first)
  session[:added_film] = true
  redirect_to '/films'
 end

 def recommendation
  #Makes sure that the film hasn't been seen in the recommender before

  #Chooses a random film in the collection
  shelfmovie = @films.sample.cast_member_ids.first
  #Finds the main actor id
  memberbio = Imdb::Search.new(shelfmovie).movies.first(7)
  #Creates array via Imdb::Search.new
  knownfor = memberbio.drop(3)
  #Drops first three elements in array + gets ids
  knownforselection = knownfor.sample.id
  #Chooses a random id from this array and creates the recommendation element
  @recommendation = Imdb::Movie.new(knownforselection)
 end
 # def show
 #  @film = params['id']
 #  @film = Films.find_by(:id => @film)
 # end

end