# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  post_id    :integer
#  body       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Comment < ApplicationRecord

  belongs_to :user
  belongs_to :post

  def self.seed_comments
    users = User.all
    posts = Post.all

    users.each do |u|
      uname = u.email.split("@").first
      posts.each do |p|
        u.comments.create post_id: p.id,
                          body: "#{uname} says - nice"
      end
    end
  end
end
