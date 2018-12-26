class User < ApplicationRecord
  devise :trackable, :omniauthable
  
  # 設定
  has_one :option, :class_name => "UserOption"
  accepts_nested_attributes_for :option
  
  validates :name, presence: true

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end
  
  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name: auth.info.name,
                         screen_name: auth.info.nickname,
                          provider: auth.provider,
                          uid: auth.uid,
#                          email:auth.extra.user_hash.email, #色々頑張りましたがtwitterではemail取得できません
                          password: Devise.friendly_token[0,20],
                          access_token: auth.credentials.token,
                          access_token_secret: auth.credentials.secret
                          )
    else
      user.update(access_token: auth.credentials.token,access_token_secret: auth.credentials.secret)
    end
    user
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_API_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET_KEY"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
  end

end
