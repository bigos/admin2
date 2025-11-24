class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :comments

  def self.seed_users
    usnx = "matthew mark luke john".split(' ')
    usnx.each do |un|
      uemail = "#{un}@example.com"
      next if User.where(email: uemail).present?

      u = User.new
      u.email = uemail
      u.password = "secret"
      u.save
    end
  end
end
