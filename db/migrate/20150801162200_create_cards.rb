
class CreateCards < ActiveRecord::Migration
  def change

    create_table  :cards do |x|

      x.belongs_to  :deck
      x.string  :question , null: false
      x.string  :answer   , null: false
      x.string  :wrong_answer1
      x.string  :wrong_answer2
      x.timestamps null: false

    end
  end
end

