class Event < ApplicationRecord
  validates :name, presence: true
  validates :description, length: { minimum: 30 }
  validates :address, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :zip, presence: true
  validates :loc, presence: true
  validates :sport, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :commits
  has_many :users, through: :commits
end
