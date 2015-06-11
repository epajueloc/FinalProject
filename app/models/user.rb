class User < ActiveRecord::Base

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :postings
  has_and_belongs_to_many :categories
  accepts_nested_attributes_for :categories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook]
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

	def self.new_with_session(params, session)
		super.tap do |user|
		 if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
		   user.email = data["email"] if user.email.blank?
		 end
		end
	end

  enum role: [:client, :worker, :admin]
end
