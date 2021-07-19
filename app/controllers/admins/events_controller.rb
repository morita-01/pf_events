class Admins::EventsController < ApplicationController
    #イベント会場一覧
    def index
        #Events = Event.page(params[:page]) カミナリを使用する際はこちら
        @events = Event.all
    end
    #イベント会場登録
    def new
        @event = Event.new
    end
    #イベント会場詳細
    def show
        @event = Event.find(params[:id])
    end
    #イベント会場編集
    def edit
        @event = Event.find(params[:id])
    end
    #イベント会場登録処理
    def create
        @event = Event.new(event_params)
        @event.save
        redirect_to admins_event_path(@event)
    end
    #イベント会場編集処理
    def update
        @event = Event.find(params[:id])
        @event.update(event_params)
        redirect_to admins_event_path(@event)
    end
    #イベント会場削除処理
    def destroy
    
    end
    private
    def event_params
        params.require(:event).permit(:image, :eventname, :address, :siteurl, :comment)
    end
end
