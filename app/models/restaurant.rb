class Restaurant < ActiveRecord::Base
  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :name, presence: true
  validates_format_of :facebook_page, with: /(www\.)?facebook\.com\/[a-zA-Z0-9]/i,:allow_blank => true
  validates_format_of :twitter_handle, with: /@[a-zA-Z0-9]/i,:allow_blank => true
  validates_format_of :website_url, with: /(www\.)?[a-zA-Z0-9]\.com/i,:allow_blank => true



  serialize :opening_days_hours, JSON
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
