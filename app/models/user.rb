class User < ActiveRecord::Base
  def self.authenticate(username, password)
    if (username and !username.strip.blank?) or
        (password and !password.strip.blank?)

      return nil
    end
  end
end
