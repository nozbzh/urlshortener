class Url < ApplicationRecord
  validates :original_url, presence: true, on: :create
  validates_format_of :original_url, with: URI.regexp
  before_create :generate_short_url

  def generate_short_url
    # make an array of ascii code for a-zA-Z0-9
    ascii = []
    ascii << (48..57).to_a  # 0-9
    ascii << (65..90).to_a  # a-z
    ascii << (97..122).to_a # A-Z
    ascii.flatten!
    # here we assign a short_url
    self.short_url = ascii.sample(6).pack('UUUUUU')
    # here we check the DB to make sure the generated short_url above doesn't
    # already exist in the DB. Until we are sure that it doesn't match an existing
    # short_url we generate a new short_url
    self.short_url = ascii.sample(6).pack('UUUUUU') until Url.find_by_short_url(self.short_url).nil?
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
