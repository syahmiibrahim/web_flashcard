
class CreateCards < ActiveRecord::Migration
  def change

    create_table  :cards do |x|
      x.belongs_to  :deck
      x.string  :question , null: false
      x.string  :answer   , null: false
      x.string  :wrong_answer
      x.string  :wrong_answer
      x.timestamps

    end
  end
end

