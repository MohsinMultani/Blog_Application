class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :blogs
  has_many :comments

  has_attached_file :profile_image, styles: { medium: "300x300>", thumb: "50x50>" }, default_url: "/assets/image.jpg"
  validates_attachment_content_type :profile_image, content_type: /\Aimage\/.*\z/

  after_create :assign_default_role
  before_create :confirmmation_token

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(:validate => false)
  end

  def assign_default_role
    self.add_role(:newuser) if self.roles.blank?
  end
    
  private

  def confirmmation_token
    if self.confirm_token.blank?
      self.confirm_token = SecureRandom.urlsafe_base64.to_s
    end
  end

end