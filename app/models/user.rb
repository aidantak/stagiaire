# frozen_string_literal: true

# User model represents individual users of the application.
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_many :stages
  has_many :applications
  has_many :reviews, foreign_key: :reviewer_id, class_name: "Review"
  has_many :reviews_received, foreign_key: :reviewed_id, class_name: "Review"
  has_many :chatrooms_as_requester, foreign_key: :requester_id, class_name: "Chatroom"
  has_many :chatrooms_as_requested, foreign_key: :requested_id, class_name: "Chatroom"
  has_many :messages
end
