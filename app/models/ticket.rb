class Ticket < ActiveRecord::Base
  belongs_to :user

  scope :recent, -> { where('created_at >= ?', 3.days.ago) }
  scope :next_open, -> { where(served_at: nil).order(:created_at).first }

  def now_serving?
    # self.user.ticket.where(served_at: nil).try(id)
  end

end
