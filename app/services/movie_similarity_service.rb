# app/services/movie_similarity_service.rb

require 'matrix'
require 'tf-idf-similarity'

class MovieSimilarityService
  def initialize
    @movies = Movie.all
    @documents = []
    @movies.each do |movie|
      content = [movie.genres, movie.plot].join(' ')
      @documents << TfIdfSimilarity::Document.new(content, id: movie.id)
    end

    if Rails.cache.fetch('tfidf_model').nil?
      @model = TfIdfSimilarity::TfIdfModel.new(@documents)
      Rails.cache.write('tfidf_model', @model)
    else
      @model = Rails.cache.fetch('tfidf_model')
    end

    @matrix = @model.similarity_matrix
  end

  def similar_movies(movie_id, top_n = 5)
    movie = Movie.find(movie_id)
    index = @documents.find_index { |doc| doc.id == movie.id }
    similarities = {}

    @documents.each_with_index do |doc, idx|
      next if doc.id == movie.id
      similarity = @matrix[index, idx]
      similarities[doc.id] = similarity
    end

    sorted_similarities = similarities.sort_by { |_, score| -score }.first(top_n)
    Movie.find(sorted_similarities.map { |id, _| id })
  end
end