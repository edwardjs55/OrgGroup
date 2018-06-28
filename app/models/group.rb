class Group < ActiveRecord::Base
  belongs_to :user

  has_many :members, dependent: :destroy
  has_many :member, through: :members, source: :user

  validates :name, :description,  presence: true
  validates :name,  length: {minimum: 6}
  validates :description,  length: {minimum: 11}
end
