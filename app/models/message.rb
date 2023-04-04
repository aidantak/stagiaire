# frozen_string_literal: true

# Message model represents individual messages within a chatroom.
class Message < ApplicationRecord
  belongs_to :chatroom
  belongs_to :user
end
