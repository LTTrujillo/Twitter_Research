class Tweet < ActiveRecord::Base

  attr_accessible :twitter_user, :tweeted_text, :tweeted_text, :user_id
  validates(:twitter_user, :presence => true)
  validates(:tweeted_text, :presence => true)
  validates(:tweeted_at, :presence   => true)
  validates(:user_id, :presence      => true)
  belongs_to(:user)
  has_and_belongs_to_many(:categories)
  def suggested_categories
     #String.split
     #String.downcase
     #text = tweeted_text.gsub(/#/,'')
     #titles = Category.all.map(&:title).map(&:downcase)
     #titles.include?(word)


  end
end














