class Article < ApplicationRecord
  extend FriendlyId
  default_scope { order('published DESC, pick DESC') }
  friendly_id :title, use: [:slugged, :finders]
  belongs_to  :category
  belongs_to  :user
  mount_base64_uploader :image, PictureUploader
  validates :title, presence: true
  validates :user, presence: true
  validates :published, presence: true
  validates :category_id, presence: true
  acts_as_taggable

  def self.search search
    self.where('lower(title) like ?', "%#{search.downcase}%")
  end

  def date_published
    year = self.published.strftime("%Y")
    month = self.published.strftime("%B")
    date = self.published.strftime("%e")
    day = self.published.strftime("%A")
    time = self.published.strftime("%I:%M %p")
    "#{day}, #{date} #{month}, #{year}. #{time}"
  end

  def date_time
    year = self.published.strftime("%y")
    month = self.published.strftime("%m")
    date = self.published.strftime("%e")
    time = self.published.strftime("%I:%M %p")
    "#{date}/#{month}/#{year} #{time}"
  end

  def tag_lists
    self.tag_list.join(", ")
  end

end
