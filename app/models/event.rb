class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, length: { minimum: 30 }, uniqueness: true
  validates :location, presence: true
  validates :level, presence: true
  validates :user_id
  validates :sport_id

  belongs_to :users
  has_many :commits
  has_many :users, through: :commits
end
