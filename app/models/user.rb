# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :country

  validates :name, :score, presence: true
end
