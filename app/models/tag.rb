# frozen_string_literal: true

# Tags are used to find similar salsa moves
class Tag < ApplicationRecord
  # Concerns

  # Scopes

  # Validation
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false }

  # Relationships
  has_many :move_tags
  has_many :moves, through: :move_tags

  # Methods

  def to_param
    "#{id}-#{name.parameterize}"
  end
end
