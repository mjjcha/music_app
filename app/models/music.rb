class Music < ActiveRecord::Base
  validates :author, presence: true
  validates :song_title, presence: true
end
