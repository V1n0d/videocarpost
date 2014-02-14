class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :profile_pic, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/assets/gravatar.jpg"
  validates_attachment_content_type :profile_pic, :content_type => /\Aimage\/.*\Z/

  has_many :cars
  has_many :payments

	validates :first_name, :last_name, :contact_number, presence: true

	def profile_image
		self.profile_pic.url ? self.profile_pic.url : "/assets/gravatar.jpg"
	end
end
