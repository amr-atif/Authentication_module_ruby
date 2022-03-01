module Crud
  require 'bcrypt'
  def Crud.create_hash(password)
    BCrypt::Password.create(password)
  end
  def Crud.verify_pass(password)
    BCrypt::Password.new(password)
  end
  def Crud.create_passwords_to_users(list)
    list.each do |user|
     user[:password]=create_hash(user[:password])
    end
  end

  def Crud.auth_user (username,password,list_of_users)
    list_of_users.each do |user|
      if username==user[:username]&& verify_pass(user[:password])==password
        return user
      end
  end
  "something went wrong"
  end
end
