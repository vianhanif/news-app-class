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
end
