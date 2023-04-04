# frozen_string_literal: true

# Application model represents applications submitted by users for stages.
class Application < ApplicationRecord
  belongs_to :user
  belongs_to :stage
end
