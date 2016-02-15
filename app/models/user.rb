class User < ActiveRecord::Base
  has_secure_password

  def does_not_suck?
    return true
  end

end
