class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant

  validates :content, presence: true, allow_blank: true
end
