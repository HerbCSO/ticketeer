# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  served_at  :datetime
#  created_at :datetime
#  updated_at :datetime
#

class Ticket < ActiveRecord::Base
  belongs_to :user

  scope :recent, ->(limit_to) { where(served_at: nil).where('created_at >= ?', 3.days.ago).order(created_at: :desc).limit(limit_to) }
  scope :next_open, -> { where(served_at: nil).order(:created_at) }

  def self.chart_data(start = 3.weeks.ago)
    total_count = count_by_day(start)
    (start.to_date..Date.today).map do |date|
      {
        served_at: date,
        count: total_count[date] || 0
      }
    end
  end

  def self.count_by_day(start)
    tickets = where(served_at: start.beginning_of_day..Time.zone.now)
    tickets = tickets.select("date(served_at) as served_at, count(*) as total_count")
    tickets = tickets.group("date(served_at)")
    tickets.each_with_object({}) do |ticket, counts|
      logger.info "ticket.served_at: #{ticket.served_at}"
      counts[ticket.served_at] = ticket.total_count
    end
  end
end
