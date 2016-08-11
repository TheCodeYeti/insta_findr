class TagsController < ApplicationController

  def index

  end

  def search
    tagname = params[:hashtag]
    url = "https://api.instagram.com/v1/tags/#{tagname}/media/recent?access_token=#{ENV['ACCESS_TOKEN']}"
    response = HTTParty.get(url)
    data = JSON.load response.body
    binding.pry
  end
end
