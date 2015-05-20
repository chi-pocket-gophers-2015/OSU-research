class User < ActiveRecord::Base
  # attr_accessor :secret_code
  attr_protected

  # has_secure_password

  CODES = %w(faculty staffer)

  has_many :experiments, foreign_key: :staffer_id
  has_many :observations, through: :experiments
  has_many :proposals, foreign_key: :faculty_id
  has_many :comments

  validates :username, :email, presence: true
  validates :faculty, inclusion: {in: [true, false],
    message: "Invalid secret code"}
  validates :password, presence: {message: "Password can't be blank"},
    confirmation: true

  def determine_faculty(code)
    self.faculty = true if code.downcase == 'faculty'
    self.faculty = false if code.downcase == 'staffer'
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password = pass
    self.password_hash = BCrypt::Password.create(pass)
  end

  def secret_code=(code)
    determine_faculty(code)
  end

  def self.authenticate(user_info)
    user = User.find_by(username: user_info[:username])
    return user if user.hashed_password == Password.new(user_info[:password])
  end

end
