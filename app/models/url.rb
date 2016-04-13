class Url < ApplicationRecord
  validates :original_url, presence: true, on: :create
  validates_format_of :original_url, with: URI.regexp
  before_create :generate_short_url

  def generate_short_url
    self.short_url = Url.last.nil? ? "1lailai" : "#{Url.last.id + 1}lailai"
  end

  def new_url?
    Url.find_by_sanitized_url(self.sanitized_url).nil?
  end

  def find_duplicate
    Url.find_by_sanitized_url(self.sanitized_url)
  end

  def sanitize
    self.sanitized_url = self.original_url.gsub(/(https?:\/\/)|(www\.)/, "")
    self.sanitized_url.slice!(-1) if self.sanitized_url[-1] == "/"
    self.sanitized_url = "http://www.#{self.sanitized_url}"
  end

end
