class UrlsController < ApplicationController
  before_action :find_url, only: [:show, :edit]

  def index
    @url = Url.new
  end

  def show
    redirect_to @url.original_url
  end

  def create
    @url = Url.new(url_params)
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

  private

  def find_url
    @url = Url.find(params[:id])
  end

  def url_params
    params.require(:url).permit(:original_url)
  end
end
