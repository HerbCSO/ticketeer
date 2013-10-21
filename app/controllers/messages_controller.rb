class MessagesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @messages = []
  end

  def carsten_bot
    # ugh - hardcoded email :(
    # TODO: find a better way to do this!
    @carsten_bot ||= User.find_by(:email => 'carsten.dreesbach@opower.com')
  end

  def create
    # @message = Message.create!(params[:message])
    @message = Message.new("#{current_user.name.split(' ').first}: #{message_params[:content]}", current_user)
    @reply = Message.new("Carsten's reply: #{generate_reply(message_params[:content])}", carsten_bot)
  end

private

  def message_params
    params.require(:message).permit(:user, :content)
  end

  def generate_reply(message_input)
    Random.new
    message = message_input.downcase
    bad_clients = ["ngma","cms","tru"]
    probably_no = ["is it possible to","do you think we can","the client asked if we could","is it feasible to","can we","should we","can i","should i"]
    if bad_clients.any? { |client| message.include? client }
      "Yeah, that was really messed up"
    elsif probably_no.any? { |nope| message.include? nope }
      ["That's a really bad idea","Absolutely not!","No, no, no"].sample
    elsif message.include? "nice t-shirt"
      "Thanks"
    elsif message.include? "sneeze"
      "Gesundheit!"
    elsif message.include? "quick question"
      "Is it really going to be quick?"
    else
      [";]", "hullo", "'sup?"].sample
    end
  end
end
