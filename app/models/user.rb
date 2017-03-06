class User < ApplicationRecord
  belongs_to  :role
  before_save { self.email = email.downcase }
  mount_base64_uploader :image, PictureUploader
  validates :name,  presence: true
  validates :role,  presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def approve?
    if self.role.admin?
      true
    elsif self.approve
      true
    else
      false
    end
  end

end
