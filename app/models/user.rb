class User < ActiveRecord::Base
  has_many :events
  before_save { self.email = email.downcase }
  has_many :events, dependent: :destroy
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :username, presence: true,
            length: { minimum: 5, maximum: 30 }
  validates :email, presence: true,
            length: { minimum: 5, maximum: 100 },
            uniqueness: { case_sensitive: false },
            format: { with: VALID_EMAIL_REGEX }
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validate :picture_size
  PIC_LIST = { "Male" => 1, "Female" => 2 }

  private
    def picture_size
      if picture.size > 10.megabytes
        errors.add(:picture, "should be less than 10 MB. Current pic size is: #{picture.size}")
      end
    end
end