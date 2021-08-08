class Publics::FavoritesController < ApplicationController
  #いいね追加処理
  def create
    @event = Event.find(params[:event_id])
    favorite = current_user.favorites.new(event_id: @event.id)
    favorite.save
    #redirect_to request.referer
  end

  #いいね解除処理
  def destroy
    @event = Event.find(params[:event_id])
    favorite = current_user.favorites.find_by(event_id: @event.id)
    favorite.destroy
    #redirect_to request.referer
  end
  private
  def favorite_params
    @event = Event.find(params[:event_id])
  end
end
