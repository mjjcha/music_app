class Music < ActiveRecord::Base
  belongs_to :user
  validates :artist, :title, presence: true
end
