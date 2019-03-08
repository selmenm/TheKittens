class User < ApplicationRecord
	
	attr_accessor :pseudo
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable#, :confirmable

	has_many :carts
	has_many :reviews
	has_many :orders
	has_one_attached :avatar
	has_many :published_items, foreign_key: 'admin_id', class_name: "Event"
	
	validates :first_name, :last_name, :username, :email, presence: true

	def self.find_first_by_auth_conditions(warden_conditions)
 		conditions = warden_conditions.dup
 		if pseudo = conditions.delete(:pseudo)
 			where(conditions.to_hash).where("lower(username) = :value OR lower(email) = :value", value: pseudo.downcase).first
 		else
 			where(conditions.to_hash).first
 		end
	end

	def fullname
		return self.first_name + ' ' + self.last_name.upcase
	end
	
end
