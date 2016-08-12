class InstagramPostsController < ApplicationController

  def index

  end

  def results
    @instagram_posts = InstagramPost.where(hashtag: params[:hashtag])
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
    instagram_post = InstagramPost.find_by(instagram_id: result['id'])
    instagram_post = InstagramPost.new() unless tag
    instagram_post.hashtag = tagname
    instagram_post.instagram_id = result['id']
    instagram_post.created_time = result['created_time']
    instagram_post.username = result['user']['username']
    instagram_post.link = result['link']
    instagram_post.video = result['videos']['standard_resolution']['url'] if result['videos']
    instagram_post.photo = result['images']['standard_resolution']['url'] if result['images']
    instagram_post.save
      binding.pry
    end

    @instagram_posts = InstagramPost.where(hashtag: tagname)

    respond_to do |format|
      format.json { render json: @instagram_posts }
      format.html
    end
  end

  private
  def search_params
    params.permit(:hashtag, :start_date, :end_date)
  end
end
