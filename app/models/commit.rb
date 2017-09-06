class Commit < ApplicationRecord
  validates :user_id, presence: true
  validates :event_id, presence: true

  belongs_to :event
  belongs_to :user
end
