class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def current_player
    @current_player ||= Player.find(session[:current_player_id])
  end
end
