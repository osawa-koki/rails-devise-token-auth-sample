# frozen_string_literal: true

require 'csv'

file = File.read(Rails.root.join('db', 'data', 'prefectures.csv'))

CSV.parse(file, headers: true).each do |row|
  id = row['id']
  name = row['name']
  prefectural_capital = row['prefectural_capital']
  Prefecture.find_or_create_by(id:) do |prefecture|
    prefecture.name = name
    prefecture.prefectural_capital = prefectural_capital
  end
end
