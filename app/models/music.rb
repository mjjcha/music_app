class Music < ActiveRecord::Base
  validates :author, :song_title, presence: true
end
