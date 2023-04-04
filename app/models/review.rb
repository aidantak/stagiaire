# frozen_string_literal: true

# Review model represents reviews and ratings given by users to other users.
class Review < ApplicationRecord
  belongs_to :reviewer, class_name: 'User'
  belongs_to :reviewed, class_name: 'User'
end
