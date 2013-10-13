class HomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  helper_method :now_serving?, :serving_current_user?

  def index
    @ticket = Ticket.where(served_at: nil).order("created_at asc").first
  end

  def take_number
    @ticket = current_user.take_ticket
    if @ticket
      flash[:success] = "Successfully took ticket number #{@ticket.id}."
      redirect_to root_path
    else
      flash[:error] = "Can't take more than one ticket at a time!"
      redirect_to root_path
    end
  end

  def now_serving?
    @ticket = Ticket.where(served_at: nil).order("created_at asc").first
    if @ticket
      @ticket.id
    else
      "None in queue"
    end
  end

  def serving_current_user?
    @ticket = Ticket.where(served_at: nil).order("created_at asc").first
    @ticket && current_user && @ticket.user_id == current_user.id
  end
end
