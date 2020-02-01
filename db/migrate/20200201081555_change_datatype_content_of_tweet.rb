class ChangeDatatypeContentOfTweet < ActiveRecord::Migration[5.2]
  def change
    change_column :tweets, :content, :text
  end
end
