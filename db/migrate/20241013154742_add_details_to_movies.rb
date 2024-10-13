class AddDetailsToMovies < ActiveRecord::Migration[7.1]
  def change
    add_column :movies, :poster_url, :string
    add_column :movies, :release_year, :string
  end
end
