



class CreateRounds < ActiveRecord::Migration
  def change

    create_table  :rounds do |x|
      x.belongs_to  :deck
      x.belongs_to  :user

      x.string  :question , null: false

      x.timestamps

    end
  end
end

