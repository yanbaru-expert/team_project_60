class MoviesController < ApplicationController

  def index
    if params[:genre]
      @movies = @php = Movie.where(genre: Movie::PHP_GENRE_LIST)
    else
      @movies = @movies = Movie.where(genre: Movie::RAILS_GENRE_LIST)
    end
  end
end