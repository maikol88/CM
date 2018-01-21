class Event < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :notes, presence: true, length: { minimum: 5, maximum: 300 }
  validates :status, presence: true,
            numericality: { only_integer: true },
            length: { maximum: 1 }
  STATUS_LIST = { "Not Started" => 1, "In Progress" => 2, "Missing" => 3, "Unavailable" => 4, "Completed" => 5, "Action Needed" => 6 }
end
