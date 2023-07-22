# frozen_string_literal: true

class PrefectureItem < ApplicationRecord
  belongs_to :prefecture
  belongs_to :item
end
