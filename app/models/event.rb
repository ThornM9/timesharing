class Event < ActiveRecord::Base
  belongs_to :user
  validates :event_name, presence: true
  validates :user_id, presence: true
end
