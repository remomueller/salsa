# frozen_string_literal: true

# Users can create moves, patterns, and assign tags
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Concerns
  include Deletable

  # Scopes

  # Validation
  validates :first_name, :last_name, presence: true

  # Relationships
  has_many :moves
  has_many :tags

  # Methods

  def name
    "#{first_name} #{last_name}"
  end
end
