class Event < ApplicationRecord
	has_many :registrations
	has_many :users, through: :registrations

	before_save { self.title = title.titleize }
  before_save { self.location = location.titleize }
  validates :title, presence: true, length: { minimum: 2, maximum: 100 }
  validates :date, presence: true
  validates :location, presence: true, length: { minimum: 2, maximum: 100 }

end
