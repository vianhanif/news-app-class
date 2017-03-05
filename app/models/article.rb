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

  def date_published
    year = self.published.strftime("%Y")
    month = self.published.strftime("%m")
    date = self.published.strftime("%-d")
    day = self.published.strftime("%A")
    time = self.published.strftime("%I:%M %p")
    suffix = day.ordinalize
    "#{day}, #{date}#{suffix} #{month}, #{year}. #{time}"
  end

end
