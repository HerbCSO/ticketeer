module ApplicationHelper
  def is_admin?
    current_user.try(:is_admin?)
  end
end
