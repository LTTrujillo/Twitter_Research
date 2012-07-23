class Tweet < ActiveRecord::Base

  attr_accessible :twitter_user, :tweeted_text, :tweeted_at
  validates(:twitter_user, :presence => true)
  validates(:tweeted_text, :presence => true)
  validates(:tweeted_at,   :presence => true)
  belongs_to(:user)
  has_and_belongs_to_many(:categories)
  def suggested_categories
    #Tweet.split()
    #String#downcase
    #Array#join
    #Array#inject
    #titles = Category.all.map(&:title).map(&:downcase)
    #titles.include?(word)
    #Category.all.map(&:title)
    #is short for..
    #Category.all.map do |x|
    # x.title
    #end

    #debugger
    words = tweeted_text.downcase.gsub(/#/,'').split(/\s+/)
    title = Category.limit(30).map(&:title)
    words.inject([]) do |collector, word|
      match = categories.detect do |cat|
        cat.title.downcase == word
      end
      collector << match.title if match
      collector
    end.sort.uniq.join(',')
  end
  # Returns a comma separated string of the current category titles
  def categories_as_string
    categories.map(&:title).sort.join(',')

  end
  # Given a comma separated string of category titles, reset the categories
  # for this tweet to the categories in the string
  def categories_as_string= (new_categories)
    categories.clear
    new_categories.clear.split(/\s*,\s*/).each do |title|
      cat = Category.with_title(title).first
      categories << cat if !cat.nil?

    end
  end
end














