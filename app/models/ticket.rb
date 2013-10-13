class Ticket < ActiveRecord::Base
  belongs_to :user

  scope :recent, where('created_at >= ?', 3.day.ago)

  def now_serving?

  end
end
