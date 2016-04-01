class Post < ActiveRecord::Base
  validates :creator, presence: true
  validates :body, presence: true

  # I have to specify the foreign key because I wanted my posts
  # to refer to their user as 'creator'
  belongs_to :creator, foreign_key: 'creator_id', class_name: 'User'

  def friendly_time
    created_at.in_time_zone('Eastern Time (US & Canada)').strftime('%F %H:%M')
  end
end