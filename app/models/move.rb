# frozen_string_literal: true

# Moves can be described, have a related video, and provide information to
# relate the move to to other moves.
class Move < ApplicationRecord
  # Concerns

  # Scopes

  # Validation
  validates :name, presence: true

  # Relationships
  has_many :move_tags
  has_many :tags, through: :move_tags

  # Methods

  def tag_tokens
    tags.pluck(:name).join(', ')
  end

  def tag_tokens=(tokens)
    self.tags = tokens.to_s.split(',').collect do |token|
      find_or_create_tag(token)
    end
    save
  end

  def find_or_create_tag(token)
    token_name = token.downcase.strip
    Tag.where('LOWER(name) = ?', token_name).first_or_create(name: token_name)
  end
end
