class HomeController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  helper_method :now_serving?, :serving_current_user?,
                :my_ticket_number, :ticket_in_queue?, :can_service_tickets?

  def index
    @ticket = Ticket.where(served_at: nil).order("created_at asc").first
  end

  def take_number
    @ticket = current_user.take_ticket
    if @ticket
      flash[:success] = "Successfully took ticket number #{@ticket.id}."
      redirect_to root_path
      return
    else
      flash[:error] = "Can't take more than one ticket at a time!"
      redirect_to root_path
      return
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

  def my_ticket_number
    current_user.current_ticket
  end

  def ticket_in_queue?
    current_user.ticket_in_queue?
  end

  def can_service_tickets?
    current_user.can_service_tickets?
  end

  def service_ticket
    if current_user.can_service_tickets?
      ticket = Ticket.where(served_at: nil).order(:created_at).first
      if ticket
        ticket.served_at = DateTime.now
        ticket.save
        ticket.user.notify_serving
        flash[:success] = "Now servicing ticket ##{ticket.id}."
      else
        flash[:success] = "No tickets in service queue."
      end
      redirect_to root_path
    else
      flash[:error] = "Sorry, you're not permitted to service tickets."
      redirect_to root_path
    end
  end
end
