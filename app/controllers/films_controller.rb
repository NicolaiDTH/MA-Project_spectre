require 'imdb'

class FilmsController < ApplicationController
 before_action :authenticate_user!


 def index

  if current_user.films.any?

   #Finds the actor ids from a random shelf movies
   shelfactor = current_user.selections.where(status: 'shelved').sample.films.actors.split(",").sample
   
   #Finds a randomised movies from the randomised actor

   random_id =  Imdb::Search.new(shelfactor).movies.shuffle.detect {|movie| movie.length && movie.length > 75 }.id

   until Films.find_by(movie_id: random_id).nil?
    random_id =  Imdb::Search.new(shelfactor).movies.shuffle.detect {|movie| movie.length && movie.length > 75 }.id
   end

    #Makes the movie with the id
    movie = Imdb::Movie.new(random_id)

   #Creates the database element of the recommendation


   #Makes sure that the film hasn't been seen entered into the database before
   @suggestion = Films.find_or_create_by(:title => movie.title, :movie_id => movie.id, :year => movie.year, :runtime => movie.length, :ratings => movie.rating, :votes => movie.votes, :poster => movie.poster, :actors => movie.cast_member_ids.take(5).join(","))

   Selection.create(films: @suggestion, user: current_user, status: 'suggested')

  end

  @shelf = current_user.selections.where(status: 'shelved').map(&:films)

  @list = current_user.selections.where(status: 'listed').map(&:films)

  @lost = current_user.selections.where(status: 'lost').map(&:films)

 end


 def show

 end


 def update

  movie = current_user.films.find params[:id]

  current_user.selections.find_by(films: movie).update(status: params[:status])

  redirect_to '/films'

 end


 def create

  title = params['search']['search']

  search = Imdb::Search.new(title)

  movie_id = search.movies.first.id

  movie = Imdb::Movie.new(movie_id)

  @films = current_user.films.create(:title => movie.title, :movie_id => movie.id, :year => movie.year, :runtime => movie.length, :ratings => movie.rating, :votes => movie.votes, :poster => movie.poster, :actors => movie.cast_member_ids.take(5).join(","))

   Selection.create(films: @films, user: current_user, status: 'shelved')

  redirect_to '/films'

 end


 def destroy

 end


end