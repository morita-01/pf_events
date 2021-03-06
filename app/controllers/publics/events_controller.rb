class Publics::EventsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :edit, :create, :update]
    
    #イベント会場一覧
    def index
      @events = Event.page(params[:page]).reverse_order
    end
    
    #イベント会場詳細
    def show
      @event = Event.find(params[:id])
    end
    
    #イベント会場編集
    def edit
      @event = Event.find(params[:id])
    end
    
    #イベント会場登録
    def new
      @event = Event.new
    end
    
    #イベント会場登録処理
    def create
      @event = Event.new(event_params)
      if @event.save
        redirect_to events_path
      else
        render :new
      end
    end
    #イベント会場編集処理
    def update
      @event = Event.find(params[:id])
      if @event.update(event_params)
        redirect_to event_path(@event)
      else
        render :edit
      end
    end
    
    #イベント会場一覧検索
    def search
      search = params[:search]
      word = params[:word]
      #全件検索
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
