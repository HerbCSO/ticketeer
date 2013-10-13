class Ticket < ActiveRecord::Base
  belongs_to :user

  def now_serving?

  end
end
