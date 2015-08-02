

class CreateGuesses < ActiveRecord::Migration
  def change

    create_table  :guesses do |x|

      x.belongs_to  :round
      x.belongs_to  :card

      x.boolean  :correctness, default: false
      x.boolean  :attempted, default: false

      x.timestamps null: false


    end
  end
end
