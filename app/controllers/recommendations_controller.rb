require 'imdb'

class RecommendationsController < ApplicationController
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
end

 def create
  @recommendation
 end

private

def shelve
end

def dismiss
end

def list
end

end