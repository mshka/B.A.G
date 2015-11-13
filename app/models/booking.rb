class Booking < ActiveRecord::Base
  belongs_to :restaurant
  belongs_to :user

  validates :date, presence: true
  validates :number_of_people, presence: true
  validate :date_cannot_be_in_the_past

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if
      !date.blank? and date < Date.today
  end
end
