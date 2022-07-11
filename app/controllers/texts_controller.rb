class TextsController < ApplicationController
  def index
    @texts = if params[:genre] == "php"
               Text.includes(:read_progresses).where(genre: Text::PHP_GENRE_LIST)
             else
               Text.includes(:read_progresses).where(genre: Text::RAILS_GENRE_LIST)
             end
  end

  def show
    @text = Text.find(params[:id])
  end
end
