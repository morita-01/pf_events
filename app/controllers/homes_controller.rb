class HomesController < ApplicationController
    #トップ画面処理
    def top
        @events = Event.all.order(id: :desc).limit(3)
    end
end
