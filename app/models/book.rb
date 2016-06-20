class Book < ActiveRecord::Base
  has_many :favorites
  has_many :books, through: :favorites

  validates :title, :author, :text, presence: true

  def self.get_random
    self.all.sample
  end
end