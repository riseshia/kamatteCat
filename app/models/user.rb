# User
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :omniauthable

  has_many :repositories

  validates :provider, presence: true
  validates :uid, presence: true

  def repos_to_check
    repositories.where(is_target: 1)
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.access_token = auth.credentials.token
    end
  end

  def client
    Octokit::Client.new(access_token: access_token)
  end
end
