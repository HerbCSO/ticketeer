module ApplicationHelper
  def format_ticket_number(number)
    if number && number.to_i
      "%03d" % (number % 1000)
    else
      "XXX"
    end
  end

  def is_admin?
    current_user.is_admin?
  end
end
