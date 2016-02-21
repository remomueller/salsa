# frozen_string_literal: true

# Moves can be described, have a related video, and provide information to
# relate the move to to other moves.
class Move < ApplicationRecord
  # Concerns

  # Scopes

  # Validation
  validates :name, :video_url, presence: true

  # Relationships
  has_many :move_tags
  has_many :tags, through: :move_tags

  # Methods

  def tag_tokens
    tags.pluck(:name).join(', ')
  end

  def tag_tokens=(tokens)
    self.tags = tokens.to_s.split(',').collect do |token|
      Tag.where('LOWER(name) = ?', token.downcase).first_or_create(name: token.downcase)
    end
    save
  end
end
