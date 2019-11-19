class AuthenticateUser
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(user_id: user.id) if user
  end

  private
  attr_accessor :email, :password

  def user
    puts 'authenticate user'
    user = User.find_by_email(email)
    puts user
    puts email
    puts password
    puts '@@@'
    puts @email
    puts @password
    return user if user && user.valid_password?(password)

    errors.add :user_authentication, 'invalid credentials'
    nil
  end
end