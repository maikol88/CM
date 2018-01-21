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
  PIC_LIST = { "Male" => 1, "Female" => 2 }
end