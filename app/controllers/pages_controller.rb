class PagesController < ApplicationController
  def home
    @url = Url.new
  end
end
