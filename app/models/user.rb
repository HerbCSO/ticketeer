require 'rest_client'

class User < ActiveRecord::Base
  has_many :tickets, dependent: :destroy

  # If we require this, then we need to edit the find_for_google_oauth2 method
  # to include a time zone in the create call
  # validates_inclusion_of :time_zone, in: ActiveSupport::TimeZone.zones_map(&:name)

  # Include most default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, #registerable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info

    user = User.where(:email => data["email"]).first
    if user
      user.uid = access_token.uid
      user.provider = access_token.provider
      user.image_url = data["image"]
      user.save if user.changed?
    else
      user = User.create(
        name: data["name"],
        email: data["email"],
        password: Devise.friendly_token[0,20],
        provider: access_token.provider,
        uid: access_token.uid,
        image_url: data["image"]
        )
    end
    user
  end

  def take_ticket
    if !self.tickets.exists?(served_at: nil)
      @ticket = self.tickets.create
      @ticket.save
      @ticket
    end
  end

  def ticket_in_queue?
    self.tickets.exists?(served_at: nil)
  end

  def is_admin?
    self.admin
  end

  def can_service_tickets?
    self.servicer
  end

  def current_ticket
    ticket = self.tickets.where(served_at: nil).first
    if ticket
      ticket.id
    else
      "None taken"
    end
  end

  def notify_serving
    send_email
  end

  def send_email
    if Rails.env.production?
      RestClient.post ApplicationController::MAILGUN_API_URL+"/messages",
          :from => "notifications@ticketeer.herokuapp.com",
          :to => self.email,
          :subject => "Now serving your ticket at Carsten's Office Hours",
          :text => "Hurry up!\nYou have 5 minutes to reply!",
          :html => "<h1>Hurry up!</h1>\nYou have <b>5 minutes</b> to reply!"
    end
  end
end
