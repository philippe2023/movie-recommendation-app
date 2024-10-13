# Project Overview

The Movie Recommendation App is a content-based recommendation system that helps users discover movies similar to their favorites. Leveraging a dataset of movies along with the OMDb API for additional movie details, the app generates personalized recommendations based on movie attributes like genres and plot descriptions. The app is built with Ruby on Rails for backend services and TailwindCSS for styling, ensuring a clean and responsive user interface.

# Key Features

1.	**Movie Search:**
- Users can search for movies by title, and the app returns a list of matching movies from the OMDb API or from the local movie database.
- Each movie in the search results is displayed with its poster, title, release year, and genres.
2.	**Movie Details Page:**
- Clicking on a movie from the search results leads to a dedicated page showing the movie’s poster, title, genres, release year, and a detailed plot description.
- The movie details are fetched from the local database, with fallback to the OMDb API if the movie is not yet stored.
3.	**Content-Based Movie Recommendations:**
- A “View Similar Movies” button is available on the movie details page, which allows users to explore movies similar to the one they are currently viewing.
- The recommendations are generated using a content-based recommendation algorithm that compares movies based on their genres and plot descriptions, using TF-IDF (Term Frequency-Inverse Document Frequency) and cosine similarity techniques.
4.	**Responsive Design with TailwindCSS:**
- The user interface is built using TailwindCSS, ensuring that the layout is clean and responsive across different screen sizes.
- Movie posters and information are displayed in a grid format, allowing for an organized and visually appealing presentation of movie recommendations.

# Machine Learning Implementation

The core of the recommendation system is a content-based filtering algorithm:

- **TF-IDF Vectorization:** The textual data (genres, plot descriptions) for each movie is converted into numerical vectors using TF-IDF. This method ensures that the words that uniquely define a movie are given higher weight in the similarity calculation.
- **Cosine Similarity:** Once the movies are vectorized, the cosine similarity between them is calculated. This measures the similarity between two movies based on the angle between their TF-IDF vectors, producing a score that reflects how close two movies are in terms of their content.
- **Recommendation Process:** When a user clicks “View Similar Movies,” the app identifies the most similar movies to the one they are viewing by finding movies with the highest cosine similarity scores. These movies are then displayed as recommendations.

# Caching and Performance Optimization

- **Caching:** To improve the performance of the recommendation system, the TF-IDF model and similarity matrix are cached. This reduces the computational cost of repeatedly calculating movie similarities, especially with a large dataset.
- **Local Storage of Movies:** Movies are stored locally in a PostgreSQL database, which allows for quick retrieval and reduces the dependency on external APIs. If a movie is not found locally, it is fetched from the OMDb API and saved for future requests.

# Technologies Used

- **Backend:** Ruby on Rails 7
- **Styling:** TailwindCSS for a responsive UI
- **Database:** PostgreSQL for storing movie data
- **External API:** OMDb API for fetching movie details
- **Machine Learning:** TF-IDF for text vectorization, Cosine Similarity for content-based filtering
- **Caching:** Rails caching for performance optimization
