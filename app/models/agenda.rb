class Agenda < ApplicationRecord
  extend FriendlyId
  default_scope { order('date DESC') }
  friendly_id :title, use: [:slugged, :finders]
  mount_base64_uploader :image, PictureUploader
  validates :title, presence: true
  validates :date, presence: true
  validates :start, presence: true
  validates :end, presence: true
  validates :organizer, presence: true
  validates :location, presence: true
  validates :title, presence: true

  def self.search search
    self.where('lower(title) like ?', "%#{search.downcase}%")
  end

  def date_occur
    year = self.date.strftime("%Y")
    month = self.date.strftime("%B")
    date = self.date.strftime("%e")
    day = self.date.strftime("%a")
    time = self.date.strftime("%I:%M %p")
    "#{day}, #{date} #{month}, #{year}"
  end

end
