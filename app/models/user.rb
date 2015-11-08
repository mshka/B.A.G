class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :last_name, presence: true
  has_attached_file :picture,
    styles: { medium: "100x100>", thumb: "32x32>" },
    convert_options: { thumb: "-quality 50 -strip",
                      original: "-quality 50 -strip" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable
end
