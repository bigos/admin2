# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  def self.seed_posts
    users = User.all

    users.each do |u|
      uname = u.email.split("@").first
      u.posts.create title: "#{uname} says",
                     body:  "#{uname} has an idea"
    end
  end
end
