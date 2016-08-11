class TagsController < ApplicationController

  def index

  end

  def results
    @tags = Tag.where(hashtag: params[:hashtag])
  end

  def search
    tagname = search_params[:hashtag]
    start_date = search_params[:start_date]
    end_date = search_params[:end_date]
    url = "https://api.instagram.com/v1/tags/#{tagname}/media/recent?access_token=#{ENV['ACCESS_TOKEN']}"
    response = HTTParty.get(url)
    body = JSON.load(response.body)
    results = body['data']

    results.each do |result|

      tag = Tag.new()
      tag.hashtag = tagname
      tag.instagram_id = result['id']
      tag.created_time = result['created_time']
      tag.username = result['username']
      tag.link = result['link']
      tag.video = result['video'] if result['video']
      tag.image = result['image'] if result['image']
      tag.save

    end
    redirect_to results_path(search_params)
  end

  private
  def search_params
    params.permit(:hashtag, :start_date, :end_date)
  end
end
