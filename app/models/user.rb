



class Post < ActiveRecord::Base

  has_many :tags, through: :pairs
  has_many :pairs

  validates :body, :presence => true
  validates :title, :presence => true




end


