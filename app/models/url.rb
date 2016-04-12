class Url < ApplicationRecord
  validates :original_url, presence: true
  validates_format_of :original_url, with: /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?\z/
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
