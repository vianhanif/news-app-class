class Article < ApplicationRecord
  extend FriendlyId
  default_scope { order('published DESC') }
  friendly_id :title, use: [:slugged, :finders]
  belongs_to  :category
  mount_base64_uploader :image, PictureUploader
  acts_as_taggable

  def self.search search
    self.where('title like ?', "%#{search}%")
  end

end
