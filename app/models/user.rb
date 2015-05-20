class User < ActiveRecord::Base
  attr_protected

  has_many :experiments, foreign_key: :staffer_id
  has_many :observations, through: :experiments
  has_many :proposals, foreign_key: :faculty_id
  has_many :comments

  validates :username, :email, :faculty, presence: true
  validates :password, presence: {message: "password can't be blank"},
    confirmation: true

  # def initialize(params)
  #   super(params)
  #   determine_faculty(params[:secret_code])
  # end

  def determine_faculty(code)
    self.faculty = true if code == 'faculty'
    self.faculty = false if code == 'staffer'
  end

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(pass)
    @password = pass
    self.password_hash = BCrypt::Password.create(pass)
  end

  def valid_password(pass)
    pass.length > 0
  end

  def self.authenticate(user_info)
    user = User.find_by(username: user_info[:username])
    return user if user.hashed_password == Password.new(user_info[:password])
  end

end
