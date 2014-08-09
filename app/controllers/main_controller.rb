class MainController < ApplicationController
  def index
    @articles = current_user && current_user.articles
  end
end
