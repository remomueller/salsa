# frozen_string_literal: true

# Relates a move with its tags
class MoveTag < ApplicationRecord
  # Relationships
  belongs_to :move
  belongs_to :tag
end
