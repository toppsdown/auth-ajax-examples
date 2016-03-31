class Post < ActiveRecord::Base
  validates :creator, presence: true
  validates :body, presence: true

  def friendly_time
    created_at.in_time_zone('Eastern Time (US & Canada)').strftime('%F %H:%M')
  end
end