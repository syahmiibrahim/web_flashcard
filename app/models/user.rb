

class User < ActiveRecord::Base

  has_many :decks, through: :round

  def self.authenticate(username, password)

    login = self.find_by(username: username)

    unless login.nil?
      login.password == password ? login : nil
    end

  end

end


