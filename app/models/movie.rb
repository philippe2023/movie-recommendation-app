class Movie < ApplicationRecord
    # Split genres into an array
    def genre_list
      genres.split(', ').map(&:strip)
    end
end
