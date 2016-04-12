class Url < ApplicationRecord
  validates :original_url, presence: true
  # add regexp to validate format of url
  before_create :generate_short_url

  def generate_short_url
    self.short_url = Url.last.nil? ? "1lailai" : "#{Url.last.id + 1}lailai"
  end

  def new_url?
    Url.find_by_original_url(self.original_url).nil?
  end

  def find_duplicate
    Url.find_by_original_url(self.original_url)
  end

end
