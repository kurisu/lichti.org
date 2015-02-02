class User < ActiveRecord::Base
  enum role: [:user, :admin]

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lockable, :confirmable, :timeoutable, :omniauthable

  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

end
