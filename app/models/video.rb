class Video < ApplicationRecord
  extend FriendlyId
  default_scope { order('created_at DESC') }
  friendly_id :title, use: [:slugged, :finders]

  def self.search search
    self.where('title like ?', "%#{search}%")
  end

end
