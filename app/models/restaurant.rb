class Restaurant < ActiveRecord::Base

  CATEGORIES =  %w(Bar Restaurant Night-club Pub Other)

  validates :name, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :category, exclusion: { in: ["Other", "Select category"], message: "must be valid" }, presence: true
  validates_format_of :facebook_page, with: /(www\.)?facebook\.com\/[a-zA-Z0-9]/i,:allow_blank => true
  validates_format_of :twitter_handle, with: /(www\.)?twitter\.com\/[a-zA-Z0-9]/i,:allow_blank => true
  validates_format_of :website_url, with: /(www\.)?[a-zA-Z0-9]\.com/i,:allow_blank => true

  has_attached_file :cover_picture,
    styles: { default: "300x300>", medium: "210x210>", thumb: "32x32>" },
    convert_options: { thumb: "-quality 50 -strip",
                      original: "-quality 50 -strip" },
    default_url: "default_cover_:style.png"

  has_attached_file :menu_picture,
    styles: { default: "600x600>", link: "210x210>"},
    convert_options: { thumb: "-quality 50 -strip",
                      original: "-quality 50 -strip" }

 has_attached_file :item_picture,
  styles: { default: "600x600>", link: "210x210>"},
  convert_options: { thumb: "-quality 50 -strip",
                    original: "-quality 50 -strip" }


  validates_attachment_content_type :cover_picture, :menu_picture, :item_picture,
    content_type: /\Aimage\/.*\z/


  serialize :opening_days_hours, JSON
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable


end
