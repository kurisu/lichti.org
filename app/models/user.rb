class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :confirmable, :timeoutable, :omniauthable
end
