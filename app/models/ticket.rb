class Ticket < ActiveRecord::Base
  belongs_to :user

  scope :recent, ->(limit_to) { where(served_at: nil).where('created_at >= ?', 3.days.ago).order(created_at: :desc).limit(limit_to) }
  scope :next_open, -> { where(served_at: nil).order(:created_at) }

end
