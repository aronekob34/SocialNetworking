class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  	#attr_accessor :current_password
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :trackable, :validatable #, :confirmable
    devise :omniauthable, :omniauth_providers => [:facebook]

	#validates :email, confirmation: true
	#validates :email_confirmation, presence: true
	validates :password, confirmation: true
	#validates :password_confirmation, presence: true
	
	# associations

	has_and_belongs_to_many :roles
	has_one :developer, :dependent => :destroy
	has_one :host, :dependent => :destroy
	has_many :messages, :dependent => :destroy

	# carrierwave
	mount_uploader :avatar, AvatarUploader

	# validations
	validates :firstname, :lastname, :roles_id, :email, presence: true

	def self.from_omniauth(auth, omniauthparams)
		#binding.pry
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
			name = auth.info.name.split(" ")   
			user.firstname = name[0]
			user.lastname = name[1]
			user.image = auth.info.image 
			user.roles_id = omniauthparams["role"]
			#user.verified = auth.info.verified 
			#user.description = auth.info.description 
			#user.location = auth.extra.raw_info.location[name]
			#user.lastname = auth.extra.raw_info.location[id]
			#user.gender = auth.info.raw_info.gender 
			#user.timezone = auth.info.raw_info.timezone
			#user.image = auth.info.image # assuming the user model has an image
			# If you are using confirmable and the provider(s) you use validate emails, 
			# uncomment the line below to skip the confirmation emails.
			#user.skip_confirmation!
		end
	end

	def self.new_with_session(params, session)
		#binding.pry
		super.tap do |user|
		  if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
		    user.email = data["email"] if user.email.blank?
		  end
		end
	end

	def country_name
	country = self.country
	ISO3166::Country[country]
	end	
 			  
end
