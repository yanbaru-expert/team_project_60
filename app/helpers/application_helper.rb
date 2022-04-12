module ApplicationHelper
  def max_width
    if controller_name == "texts" && action_name == "show"
      "mw-md"
      # Devise 導入後にコメントアウトを解除
    elsif devise_controller?
      "mw-sm"
    else
      "mw-xl"
    end
  end

  def page_title
    if params[:genre] == "php"
      "PHP 動画"
    else
      "Ruby/Rails 動画"
    end
  end

  def page_title_text
    if params[:genre] == "php"
      "PHPテキスト教材ページ"
    else
      "Ruby/Rails テキスト教材"
    end
  end
end
