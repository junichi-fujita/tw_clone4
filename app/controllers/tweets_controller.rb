class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]

  def index
    @tweets = Tweet.order(updated_at: :desc).page(params[:page]).per(5)
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)
    if params[:back]
      render :new
    else
      if @tweet.save
        redirect_to :tweets, notice: "投稿しました。"
      else
        render "new"
      end
    end
  end

  def show

  end

  def edit
  end

  def update
    @tweet.assign_attributes(tweet_params)
    if params[:back]
      render :edit
    else
      if @tweet.save
        redirect_to :tweets, notice: "変更しました。"
      else
        render "edit"
      end
    end
  end

  def destroy
    @tweet.destroy
    redirect_to :tweets, notice: "削除しました。"
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    @tweet.id = params[:id]
    if @tweet.invalid?
      render "new"
    end
  end

  private 

  def tweet_params
    params.require(:tweet).permit(:content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
