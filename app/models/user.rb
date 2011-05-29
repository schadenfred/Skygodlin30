class User < ActiveRecord::Base
  has_many :subdomains, :dependent => :destroy

  # Include default devise modules. Others available are:
  #   :token_authenticatable, :encryptable, :confirmable,
  #   :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name,  :email, :password, :password_confirmation, :remember_me

  # validations
  validates_presence_of :name
  validates_uniqueness_of :name, :email, :case_sensitive => false

  # Friendly ID
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true
end

