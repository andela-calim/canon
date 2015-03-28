class HomeController < ApplicationController

  def index
    if signed_in?
      redirect_to questions_path
    end
  end
end