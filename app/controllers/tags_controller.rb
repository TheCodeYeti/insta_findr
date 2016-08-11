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

      # this basically turns it into an upsert even thought I'm not using Mongo
      # tag = Tag.new() unless tag = Tag.find(instagram_id: result['id'])
      tag = Tag.new()
      tag.hashtag = tagname
      tag.instagram_id = result['id']
      tag.created_time = result['created_time']
      tag.username = result['user']['username']
      tag.link = result['link']
      tag.video = result['videos']['standard_resolution']['url'] if result['videos']
      tag.photo = result['images']['standard_resolution']['url'] if result['images']
      tag.save

    end

    @tags = Tag.where(hashtag: params[:hashtag])

    respond_to do |format|
      format.json { @tags }
      format.html
    end
  end

  private
  def search_params
    params.permit(:hashtag, :start_date, :end_date)
  end
end
