class Blog < ActiveRecord::Base
    validates :title, :auther, :description, :presence => true
    validates :title, :uniqueness => true
    belongs_to :user
    has_many :comments
end
