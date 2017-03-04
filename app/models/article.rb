class Article < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  belongs_to  :category
  acts_as_taggable
end
