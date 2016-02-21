# frozen_string_literal: true

# Tracks each day a user has practiced a move
class UserMove < ApplicationRecord
  # Concerns

  # Scopes

  # Validation
  validates :user_id, :move_id, :practiced_on, presence: true

  # Relationships
  belongs_to :user
  belongs_to :move

  # Methods
end
