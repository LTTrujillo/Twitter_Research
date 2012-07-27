class Tweet < ActiveRecord::Base

  attr_accessible :twitter_user, :tweeted_text, :tweeted_at
  validates(:twitter_user, :presence => true)
  validates(:tweeted_text, :presence => true)
  validates(:tweeted_at,   :presence => true)
  scope(:with_notes, includes(:notes).order('notes.created_at desc'))
  belongs_to(:user)
  has_and_belongs_to_many(:categories)
  has_many(:notes)

  def suggested_categories
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

  def categories_as_string
    categories.map(&:title).sort.join(',')

  end

  def categories_as_string= (new_categories)
    categories.clear
    new_categories.clear.split(/\s*,\s*/).each do |title|
      cat = Category.with_title(title).first
      categories << cat if !cat.nil?

    end
  end
end














