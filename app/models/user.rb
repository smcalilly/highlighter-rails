class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :highlights
  has_many :sources
  has_many :notes
  has_many :assortments
  has_many :projects
  has_many :drafts

  # not sure i understand what this is doing? is this from v1 of tagging?
  has_many :tags, :through => :notes
end
