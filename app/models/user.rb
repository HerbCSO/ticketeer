class User < ActiveRecord::Base
  has_many :tickets, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(:email => data["email"]).first

    unless user
      user = User.create(
        name: data["name"],
        email: data["email"],
        password: Devise.friendly_token[0,20]
        )
    end
    user
  end

  def take_ticket
    if !self.tickets.exists?(served_at: nil)
      @ticket = self.tickets.create
      @ticket.save
    end
  end
end
