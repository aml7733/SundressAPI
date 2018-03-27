class User < ApplicationRecord
  has_many :authentications, class_name: 'UserAuthentication', dependent: :destroy

  rolify
  # Include default devise modules. Others available are: :confirmable, :lockable, :timeoutable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, omniauth_providers: [:google_oauth2]

  def self.create_or_update_from_omniauth(params)
    user = User.find_by(uid: params[:uid]) || User.new
    user.attributes = {
     email: params[:info][:email],
     password: Devise.friendly_token,
     uid: params[:uid],
     first_name: params[:info][:first_name],
     last_name: params[:info][:last_name]
    }
    user.save!
    user
  end
end
