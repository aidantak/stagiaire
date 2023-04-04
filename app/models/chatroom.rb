# frozen_string_literal: true

# Chatroom model represents a conversation between two users.
class Chatroom < ApplicationRecord
  belongs_to :requester, class_name: 'User'
  belongs_to :requested, class_name: 'User'
  has_many :messages
end
