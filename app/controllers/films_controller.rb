require 'imdb'

class FilmsController < ApplicationController
 before_action :authenticate_user!

 def index
 if Films.any?
 #Makes sure that the film hasn't been seen in the recommender before 
 

 #Finds the actor ids
 shelfmovie = Films.first.actors.split(",").sample
 
 #Creates array via Imdb::Search.new
 memberbio = Imdb::Search.new(shelfmovie).movies.first(7)
 
 #Drops first three elements in array + gets ids
 knownfor = memberbio.drop(3)
 
 #Chooses a random movie from the imdb 'known for' section
 knownforselection = knownfor.sample.id
 
 #Chooses a random id from this array for the poster element
 @poster = Imdb::Movie.new(knownforselection).poster
 
 #Creates an instance of the recommendation for
 suggestion = Imdb::Movie.new(knownforselection)
 end
  @films = Films.all
 end

 def new
 end

 def create
  title = params['search']['search']
  search = Imdb::Search.new(title)
  movie_id = search.movies.first.id
  movie = Imdb::Movie.new(movie_id)
  @films = Films.create(:title => movie.title, :year => movie.year, :runtime => movie.length, :ratings => movie.rating, :votes => movie.votes, :poster => movie.poster, :actors => movie.cast_member_ids.take(3).join(","))
  redirect_to 'films'
 end
end

 def update
 end

 def destroy
 end

private

def shelve
 Films.create(:title => suggestion.title, :year => suggestion.year, :runtime => suggestion.length, :ratings => suggestion.rating, :votes => suggestion.votes, :poster => suggestion.poster, :actors => suggestion.cast_member_ids.take(3).join(","))
end

def dismiss
end

def list
end