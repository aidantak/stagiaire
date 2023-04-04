# frozen_string_literal: true

# Profile model represents user profiles with their personal information.
class Profile < ApplicationRecord
  belongs_to :user
end
