# frozen_string_literal: true

# Tags are used to find similar salsa moves
class Tag < ApplicationRecord
  # Concerns

  # Scopes

  # Validation
  validates :user_id, presence: true
  validates :name, presence: true,
                   uniqueness: { case_sensitive: false, scope: :user_id }

  # Relationships
  belongs_to :user
  has_many :move_tags
  has_many :moves, through: :move_tags

  # Methods

  def to_param
    "#{id}-#{name.parameterize}"
  end

  def self.find_or_create_tag(token, user_id)
    token_name = token.downcase.strip
    Tag.where(user_id: user_id)
       .where('LOWER(name) = ?', token_name)
       .first_or_create(name: token_name)
  end
end
