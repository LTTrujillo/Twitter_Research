class Tweet < ActiveRecord::Base

  attr_accessible :twitter_user, :tweeted_text, :tweeted_text, :user_id
  validates(:twitter_user, :presence => true)
  validates(:tweeted_text, :presence => true)
  validates(:tweeted_at, :presence   => true)
  validates(:user_id, :presence      => true)
  belongs_to(:user)
  has_and_belongs_to_many(:categories)
  def suggested_categories
     # Tweet.split()
     #String#downcase
    #Array#join
    #Array#inject
    words = tweeted_text.downcase.gsub(/#/,'').split(/\s+/)
    title = Category.limit(30).map(&:title)
    words.inject([]) do |collector, word|
      match = categories.detect {|c|c.title_match?(word)}
      collector << match.title if match
      collector
     end.sort.join(',')
     #titles = Category.all.map(&:title).map(&:downcase)
    #titles.include?(word)
    #Category.all.map(&:title)
    #is short for..
    #Category.all.map do |x|
    # x.title
    #end

  end
end














