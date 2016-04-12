class UrlsController < ApplicationController

  def show
    @url = Url.find(params[:id])
    redirect_to @url.original_url
  end

  def create
    @url = Url.new(url_params)
    # need to check for existing original url in DB
    if @url.save
      flash[:success] = "Your URL has been shortened!"
      redirect_to root_path
    else
      render 'pages/home'
    end
  end

  private

  def url_params
    params.require(:url).permit(:original_url)
  end
end
