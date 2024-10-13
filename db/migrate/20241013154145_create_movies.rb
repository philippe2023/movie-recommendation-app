class CreateMovies < ActiveRecord::Migration[7.1]
  def change
    create_table :movies do |t|
      t.string :imdb_id
      t.string :title
      t.string :genres
      t.text :plot

      t.timestamps
    end
  end
end
