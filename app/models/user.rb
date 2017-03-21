class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blogs
  has_many :comments

  has_attached_file :profile_image, styles: { medium: "300x300>", thumb: "50x50>" }, default_url: "/assets/image.jpg"
  validates_attachment_content_type :profile_image, content_type: /\Aimage\/.*\z/
end