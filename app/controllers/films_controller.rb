require 'imdb'

class FilmsController < ApplicationController
 before_action :authenticate_user!

 def index
  if Films.any?
  #Makes sure that the film hasn't been seen in the recommender before 
  shelfmovie = Films.first.actors.split(",").sample
  #Finds the main actor id
  memberbio = Imdb::Search.new(shelfmovie).movies.first(7)
  #Creates array via Imdb::Search.new
  knownfor = memberbio.drop(3)
  #Drops first three elements in array + gets ids
  knownforselection = knownfor.sample.id
  #Chooses a random id from this array for the poster element
  @recommendation = Imdb::Movie.new(knownforselection).poster
  #Creates an instance of the recommendation for 
  end
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

private

def shelve
end

def dismiss
end

def list
end