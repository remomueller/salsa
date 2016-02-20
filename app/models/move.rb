# frozen_string_literal: true

# Moves can be described, have a related video, and provide information to
# relate the move to to other moves.
class Move < ApplicationRecord
  # Concerns

  # Scopes

  # Validation
  validates :name, presence: true

  # Relationships

  # Methods

end
