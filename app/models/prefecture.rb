# frozen_string_literal: true

class Prefecture < ApplicationRecord
  has_many :prefecture_items, dependent: :destroy
  has_many :items, through: :prefecture_items
end
