class PagesController < ApplicationController
  def home
    @movies = []
    if params[:query].present?
      logger.debug "Search query: #{params[:query]}"
      omdb_service = OmdbService.new
      response = omdb_service.search_movies(params[:query])
      logger.debug "API response: #{response.inspect}"
      if response.success? && response['Search']
        @movies = response['Search']
      else
        flash.now[:alert] = 'Error fetching movie data.'
      end
    end
  end

  def about
  end

  def contact
  end
end
