# app/controllers/movies_controller.rb

class MoviesController < ApplicationController
  def show
    # Show the details of the movie
    @movie = Movie.find_by(imdb_id: params[:id])

    unless @movie
      # Fetch the movie details from OMDb API if not in the database
      omdb_service = OmdbService.new
      details = omdb_service.get_movie_details(params[:id])

      if details.success?
        @movie = Movie.create(
          imdb_id: details['imdbID'],
          title: details['Title'],
          genres: details['Genre'],
          plot: details['Plot'],
          poster_url: details['Poster'] != 'N/A' ? details['Poster'] : nil,
          release_year: details['Year']
        )
      else
        redirect_to root_path, alert: 'Movie not found.'
      end
    end
  end

  def similar
    # Fetch the similar movies when the button is clicked
    @movie = Movie.find_by(imdb_id: params[:id])

    if @movie
      similarity_service = MovieSimilarityService.new
      @similar_movies = similarity_service.similar_movies(@movie.id)
    else
      redirect_to root_path, alert: 'Movie not found.'
    end
  end
end