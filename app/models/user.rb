class User < ApplicationRecord
  mount_uploader :image, UserImageUploader
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  VALID_NAMES = /\^[a-zA-Z0-9]*\z/.freeze

  validates :first_name, :last_name, :name, :region, :image, presence: true
  validates :first_name, :last_name, :name, format: { with: VALID_NAMES }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :password, :password_confirmation, presence: true, length: { minimum: 10 }
  validates :sex, inclusion: { in: %w[male female] }
  validate :password_match_validation

  protected

  def password_match_validation
    return unless password != password_confirmation

    errors.add(:password, 'Password and password confirmation should match')
    errors.add(:password_confirmation, 'Password and password confirmation should match')
    throw :abort
  end

end
