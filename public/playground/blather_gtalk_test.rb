require 'blather/client'

setup 'ticketeer@dreesbach.org/notifications', ENV['TICKETEER_JABBER_PW'], 'talk.google.com'
when_ready do
  puts "before say"
  say 'carsten.dreesbach@opower.com/AdiumA3B50692', "This is a test"
  puts "after say"
end
subscription :request? do |s|
  puts "Subscribe request: #{s}"
  write_to_stream s.approve!
end

message :chat?, :body => 'exit' do |m|
  say m.from, 'Exiting ...'
  shutdown
end

message :chat?, :body do |m|
  puts "Message: #{m}"
  write_to_stream m.reply # "I am a robot!"
  puts "Reply: #{m.reply}"
  say m.from, "I am a robot!"
end
