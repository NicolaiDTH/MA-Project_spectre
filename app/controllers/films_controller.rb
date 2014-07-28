require 'imdb'

class FilmsController < ApplicationController
 before_action :authenticate_user!

 def index
  if Films.any?
  
   #Makes sure that the film hasn't been seen entered into the database before 

   #Finds the actor ids from a random shelf movies
   shelfactor = Films.where(status: 'shelved').sample.actors.split(",").sample
   
   #Finds a randomised movies from the randomised actor
   movie_id =  Imdb::Search.new(shelfactor).movies.shuffle.detect {|movie| movie.length && movie.length > 65 }.id

   #Makes the movie with the id
   movie = Imdb::Movie.new(movie_id)
   
   #Creates the database element of the recommendation
   @suggestion = Films.create(:title => movie.title, :movie_id => movie.id, :year => movie.year, :runtime => movie.length, :ratings => movie.rating, :votes => movie.votes, :poster => movie.poster, :actors => movie.cast_member_ids.take(5).join(","), :status => 'suggested')

   if Films.find_by(movie_id: @suggestion.id)
    redirect_to '/films'
   end
  end
  @shelf = Films.where(status: 'shelved')
  @list = Films.where(status: 'listed')
 end

 def update
  movie = Films.find params[:id]
  movie.status = params[:status]
  movie.save

  redirect_to '/films'
 end

 def create
  title = params['search']['search']
  search = Imdb::Search.new(title)
  movie_id = search.movies.first.id
  movie = Imdb::Movie.new(movie_id)
  @films = Films.create(:title => movie.title, :movie_id => movie.id, :year => movie.year, :runtime => movie.length, :ratings => movie.rating, :votes => movie.votes, :poster => movie.poster, :actors => movie.cast_member_ids.take(5).join(","), :status => 'shelved')
  redirect_to '/films'
 end

 def destroy
 end

end
