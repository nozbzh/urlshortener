class PagesController < ApplicationController
  def home
    @url = Url.new
    @short_url = Url.last.short_url unless Url.last.nil?
  end
end
