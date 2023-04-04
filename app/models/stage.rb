# frozen_string_literal: true

# Stage model represents the stages (internships) posted by users.
class Stage < ApplicationRecord
  belongs_to :user
  has_many :applications
end
