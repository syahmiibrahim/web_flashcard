
class CreateDecks < ActiveRecord::Migration
  def change

    create_table  :decks do |x|
      #a deck has many cards
      x.string  :subject , null: false
      x.timestamps

    end
  end
end
