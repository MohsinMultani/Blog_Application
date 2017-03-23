class Blog < ActiveRecord::Base
    validates :title, :auther, :description, :presence => true
    validates :title, :uniqueness => true
    belongs_to :user
    has_many :comments

    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/assets/image.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    resourcify

    before_save :before_save_callback_call
    after_save :after_save_callback_call

    def before_save_callback_call
      puts "Before Save callback called....."
    end

    def after_save_callback_call
      puts "after_save_callback_call  called....."
    end

end
