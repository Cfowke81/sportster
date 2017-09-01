class Commit < ApplicationRecord
  validates :user_id
  validates :event_id

  belongs_to :event
  belongs_to :user
end
