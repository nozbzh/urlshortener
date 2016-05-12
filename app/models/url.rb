class Url < ApplicationRecord
  validates :original_url, presence: true, on: :create
  validates_format_of :original_url,
    with: /\A(?:(?:http|https):\/\/)?([-a-zA-Z0-9.]{2,256}\.[a-z]{2,4})\b(?:\/[-a-zA-Z0-9@,!:%_\+.~#?&\/\/=]*)?\z/
  before_create :generate_short_url

  def generate_short_url
    chars = ['0'..'9','A'..'Z','a'..'z'].map{|range| range.to_a}.flatten
    # here we assign a short_url
    self.short_url = 6.times.map{chars.sample}.join
    # here we check the DB to make sure the generated short_url above doesn't
    # already exist in the DB. We generate a new short_url until we are sure that
    # it doesn't match an existing short_url
    self.short_url = 6.times.map{chars.sample}.join until Url.find_by_short_url(self.short_url).nil?
  end

  def find_duplicate
    Url.find_by_sanitized_url(self.sanitized_url)
  end

  def new_url?
    find_duplicate.nil?
  end

  def sanitize
    self.original_url.strip!
    self.sanitized_url = self.original_url.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
    self.sanitized_url.slice!(-1) if self.sanitized_url[-1] == "/"
    self.sanitized_url = "http://#{self.sanitized_url}"
  end
end
