class PlayerController < ApplicationController
  
  respond_to :xml, :json, :html
  
  def update
    @message = current_player.perform(params[:action]) || 'I have no idea what you are talking about.'
    respond_with {:action => params[:action], :message => @message}
  end
  
end