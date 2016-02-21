# frozen_string_literal: true

# Moves can be described, have a related video, and provide information to
# relate the move to to other moves.
class Move < ApplicationRecord
  # Concerns

  # Scopes

  # Validation
  validates :name, :user_id, presence: true

  # Relationships
  belongs_to :user
  has_many :move_tags
  has_many :tags, through: :move_tags
  has_many :user_moves, -> { order(:practiced_on) }

  # Methods

  def tag_tokens
    tags.pluck(:name).join(', ')
  end

  def update_tags(tokens)
    clean_tokens = tokens.to_s.split(',').collect(&:strip).reject(&:blank?).uniq
    move_tags.destroy_all
    clean_tokens.each do |token|
      tags << Tag.find_or_create_tag(token, user_id)
    end
  end

  def add_practice_date(current_user, date)
    user_moves.where(user_id: current_user.id, practiced_on: date).first_or_create
  end

  def practiced_today?
    user_moves.where(practiced_on: Time.zone.today).count == 1
  end
end
