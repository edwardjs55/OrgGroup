class User < ActiveRecord::Base
  has_secure_password
  
  has_many :groups, dependent: :destroy
  has_many :members
  has_many :orgs, through: :members, source: :group


  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, :email,  presence: true
  validates :email, uniqueness: true  ,format: {with: EMAIL_REGEX }
  before_save :downcase_fields
  #test to see if email can be created using uppercase letters.  It shouldn't be allowed!!

  def downcase_fields
    self.email.downcase!
  end

  def fullName
    self.first_name + ' '+self.last_name
  end



end