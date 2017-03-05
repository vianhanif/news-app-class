class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
  validates :name, presence: true
end
