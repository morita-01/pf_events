class Event < ApplicationRecord
    #belongs_to :user
    
    attachment :image
    has_many :favorites, dependent: :destroy
    has_many :event_comments, dependent: :destroy
    validates :eventname, presence: true, length: { maximum: 20 }
    validates :address, presence: true, length: { maximum: 50 }
    validates :comment, presence: true, length: { maximum: 100 }
    validates :siteurl, presence: true, format: /\A#{URI::regexp(%w(http https))}\z/
    validates :image, presence: true
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
    
  def self.looks(searches, words)
    if searches == "perfect_match"
      @event = Event.where("eventname LIKE ?", "#{words}")
    elsif searches == "start_match"
      @event = Event.where("eventname LIKE ?", "#{words}%")
    elsif searches == "back_match"
      @event = Event.where("eventname LIKE ?", "%#{words}")
    else
      @event = Event.where("eventname LIKE ?", "%#{words}%")
    end
  end
end
