
class Deck < ActiveRecord::Base

  has_many  :cards
  has_many  :users, through: :round


end


