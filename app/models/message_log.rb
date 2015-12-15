# == Schema Information
#
# Table name: message_logs
#
#  id                :integer          not null, primary key
#  to                :string
#  from              :string
#  status            :string
#  sid               :string
#  error_code        :string
#  error_message     :string
#  date_sent         :datetime
#  account_sid       :string
#  billing_reference :string
#  message_id        :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class MessageLog < ActiveRecord::Base
  belongs_to :message
end