class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :content, presence: true
  validates_presence_of :rating, message: "can't be a zero"
end
