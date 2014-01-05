class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def gravatar
    "http://gravatar.com/avatar/" + Digest::MD5.hexdigest(email.downcase)
  end
end
