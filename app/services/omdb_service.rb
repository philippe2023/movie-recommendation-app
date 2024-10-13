class OmdbService
  include HTTParty
  base_uri 'http://www.omdbapi.com/'

  def initialize(api_key = ENV['OMDB_API_KEY'])
    @api_key = api_key
  end

  def search_movies(query)
    options = { query: { apikey: @api_key, s: query } }
    self.class.get('/', options)
  end

  def get_movie_details(imdb_id)
    options = { query: { apikey: @api_key, i: imdb_id } }
    self.class.get('/', options)
  end
end