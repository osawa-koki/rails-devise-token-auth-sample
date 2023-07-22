# frozen_string_literal: true

class Item < ApplicationRecord
  has_many :prefecture_items, dependent: :destroy
  has_many :prefectures, through: :prefecture_items
end
