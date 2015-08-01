
class CreateUsers < ActiveRecord::Migration
  def change

    create_table  :users do |x|
      #a user has many round


      x.string  :name , null: false
      x.string  :username, null: false
      x.string  :password, null: false
      x.timestamps




    end
  end
end

