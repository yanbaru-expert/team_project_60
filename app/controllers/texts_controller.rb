class TextsController < ApplicationController
  def index
    @texts = if params[:genre] == "php"
               Text.where(genre: Text::PHP_GENRE_LIST)
             else
               Text.where(genre: Text::RAILS_GENRE_LIST)
             end

    @texts = Text.includes(:read_progresses)
  end

  def show
    @text = Text.find(params[:id])
  end
end
