class Secret < ActiveRecord::Base
  validates :content, presence: true

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :users_liked, through: :likes, source: :user

  def like_by_user(uesr)
    Like.find_by_user_id self.users_liked{|u| u == user}.last
  end
end
