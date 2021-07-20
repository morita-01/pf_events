class SearchesController < ApplicationController
  def search
    search = params[:search]
    word = params[:word]
    @events = Event.looks(search, word)
  #@keyword = params[:keyword]
  #render "search"
  end
end
