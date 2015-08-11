class Music < ActiveRecord::Base
  belongs_to :user
  validates :author, :song_title, presence: true
end
