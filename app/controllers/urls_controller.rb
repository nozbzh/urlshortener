class UrlsController < ApplicationController

  def index
    @url = Url.new
  end

  def show
    @url = Url.find_by_short_url(params[:id])
    redirect_to @url.sanitized_url
  end

  def create
    @url = Url.new(url_params)
    @url.sanitize
    if @url.new_url?
      if @url.save
        redirect_to edit_url_path(@url)
      else
        render 'index'
      end
    else
      redirect_to edit_url_path(@url.find_duplicate)
    end
  end

  def edit
    results = GoogleCustomSearchApi.search('komodo', searchType: 'image')
    total_images = results["items"].length
    @image = results["items"][(1..(total_images)).to_a.sample]["link"]
    @url = Url.find(params[:id])
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
