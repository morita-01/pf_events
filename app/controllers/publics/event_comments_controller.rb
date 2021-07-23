class Publics::EventCommentsController < ApplicationController
  def create
    @event = Event.find(params[:event_id])
    comment = current_user.event_comments.new(event_comment_params)
    comment.event_id = @event.id
    comment.save
    #redirect_to request.referer
  end
  
  def destroy
    @comment = EventComment.find(params[:id])
    @event = @comment.event
    @comment.destroy
    #redirect_to request.referer
  end
  
  private
  def event_comment_params
    #binding.pry
    params.permit(:eventcomment)
  end
end
