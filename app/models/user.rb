class User < ActiveRecord::Base
  # Include default devise modules. Other modules include
  #   :token_authenticatable, :encryptable, :confirmable,
  #   :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  # Validations
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false
end
