class MoviesController < ApplicationController
  def show
    omdb_service = OmdbService.new
    response = omdb_service.get_movie_details(params[:id])
    if response.success?
      @movie = response.parsed_response
    else
      redirect_to root_path, alert: 'Error fetching movie details.'
    end
  end
end
