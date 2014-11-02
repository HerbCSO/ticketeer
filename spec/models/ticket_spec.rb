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
# Indexes
#
#  index_tickets_on_user_id  (user_id)
#

require 'spec_helper'

describe Ticket, :type => :model do
  skip "add some examples to (or delete) #{__FILE__}"
end
