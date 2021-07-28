class HomesController < ApplicationController
    def top
        @events = Event.all.order(id: :desc).limit(3)
    end
end
