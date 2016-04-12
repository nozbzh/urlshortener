class Url < ApplicationRecord
  validates :original_url, presence: true
end
