class Url < ApplicationRecord
  validates :original_url, presence: true
  # add regexp to validate format of url
  before_create :generate_short_url

  def generate_short_url
    self.short_url = Url.last.nil? ? "1hahaha" : "#{Url.last.id + 1}hahaha"
  end
end
