



class CreateRounds < ActiveRecord::Migration
  def change

    create_table  :rounds do |x|
      x.belongs_to  :deck
      x.belongs_to  :user


      x.timestamps null: false

    end
  end
end

