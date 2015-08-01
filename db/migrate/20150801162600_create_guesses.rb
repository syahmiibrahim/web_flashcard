

class CreateGuesses < ActiveRecord::Migration
  def change

    create_table  :guesses do |x|

      x.belongs_to  :round
      x.belongs_to  :deck


      x.boolean  :correctness, default: false

    end
  end
end
