class Event < ApplicationRecord
    #belongs_to :user
    
    attachment :image
    has_many :favorites, dependent: :destroy
    has_many :event_comments, dependent: :destroy
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
    
  def self.looks(searches, words)
    if searches == "perfect_match"
      @event = Event.where("title LIKE ?", "#{words}")
    elsif searches == "start_match"
      @event = Event.where("title LIKE ?", "#{words}%")
    elsif searches == "back_match"
      @event = Event.where("title LIKE ?", "%#{words}")
    else
      @event = Event.where("title LIKE ?", "%#{words}%")
    end
  end
end
