class Book < ActiveRecord::Base
  has_many :favorites
  has_many :users, through: :favorites

  validates :title, :author, :text, presence: true

  def self.get_random
    self.all.sample
  end

  def self.most_favorited
    hash = {}
    self.all.each do |book|
      hash[book.users.count] = book.id
    end 
    index = hash.keys.max
    book_id = hash[index]
    book = self.find(book_id)
    book
  end
end