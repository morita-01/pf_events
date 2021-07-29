class Publics::EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :create, :update]
    
    def index
      @events = Event.page(params[:page]).reverse_order
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
      if @event.save
        redirect_to publics_events_path
      else
        render :new
      end
    end
    #イベント会場編集処理
    def update
      @event = Event.find(params[:id])
      if @event.update(event_params)
        redirect_to publics_event_path(@event)
      else
        render :edit
      end
    end
    
    def search
      search = params[:search]
      word = params[:word]
      
      if word.empty?
        @events = Event.page(params[:page]).reverse_order
      else
        @events = Event.looks(search, word).page(params[:page]).reverse_order
      end
      render :index
    end
    
    private
    def event_params
      params.require(:event).permit(:image, :eventname, :address, :siteurl, :comment)
    end
end
