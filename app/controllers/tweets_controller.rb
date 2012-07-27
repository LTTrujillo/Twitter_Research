class TweetsController < ApplicationController

  def index #index deals with multiple tweets
    @tweets = current_user.tweets.order('tweeted_at desc').limit(25)
    respond_with(@tweets)
  end

  def show #pull a single tweet from the database
    @tweet = current_user.tweets.with_notes.find(params[:id])
    respond_with(@tweet)
  end

  def create #create deals with a single tweets
    @tweet = current_user.tweets.create(params[:tweet])
    respond_with(@tweet, :location => tweets_url)
  end

  def edit
    @tweet = current_user.find(params[:id])
    respond_with(@tweet)
  end

  def update
    @tweet = current_user.find(params[:id])
    @tweet.update_attributes(params[:tweet])
    respond_with(@tweet)
  end

end


