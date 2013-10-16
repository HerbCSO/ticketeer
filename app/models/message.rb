class Message
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :content, :user, :created_at

  def initialize(content = nil, user = nil)
    @content = content
    @user = user
  end

  def created_at
    Time.zone.now
  end

  def persisted?
    false
  end
end
