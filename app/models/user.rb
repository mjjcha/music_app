class User < ActiveRecord::Base
  has_many :musics
  validates :email, :password, presence: true
end
