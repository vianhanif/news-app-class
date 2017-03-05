class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :finders]
end
