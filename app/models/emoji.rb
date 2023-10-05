class Emoji < ApplicationRecord
  has_one_attached :original
  has_one_attached :without_background
end
