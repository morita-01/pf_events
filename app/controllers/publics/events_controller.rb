class Publics::EventsController < ApplicationController
    def index
        @events = Event.all
    end
    
    def show
        @event = Event.find(params[:id])
    end
    
    def edit
        @event = Event.find(params[:id])
    end
    
    def new
        @event = Event.new
    end
    
    #イベント会場登録処理
    def create
        @event = Event.new(event_params)
        @event.save
        redirect_to publics_events_path
    end
    #イベント会場編集処理
    def update
        @event = Event.find(params[:id])
        @event.update(event_params)
        redirect_to publics_event_path(@event)
    end
    #イベント会場削除処理
    def destroy
        @event = Event.find(params[:id])
        @event.destroy
        redirect_to publics_events_path
    end
    
    private
    def event_params
        params.require(:event).permit(:image, :eventname, :address, :siteurl, :comment)
    end
end
