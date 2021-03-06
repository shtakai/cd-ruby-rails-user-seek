class User < ActiveRecord::Base
  before_create :downcase_email

  EMAIL_REGEX = /^([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})$/i
  has_secure_password
  validates :name, :email, presence: true
  validates_uniqueness_of :email
  validates :email, format:{with: EMAIL_REGEX, multiline: true}

  has_many :secrets
  has_many :likes, dependent: :destroy
  has_many :secrets_liked, through: :likes, source: :secret


  private

  def downcase_email
    self.email = self.email.downcase
  end
end
