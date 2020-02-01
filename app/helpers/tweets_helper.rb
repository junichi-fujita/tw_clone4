module TweetsHelper
  def choose_new_or_edit
    if action_name == "new" || action_name == "confirm"
      :confirm_tweets
    elsif action_name == "edit"
      [:confirm, @tweet]
    end
  end

  def return_new_or_edit
    unless @tweet.id?
      :tweets
    else
      :tweet
    end
  end

  def confirm_from_method
    @tweet.id ? "patch" : "post"
  end
end
