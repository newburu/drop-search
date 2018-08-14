class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include Jpmobile::ViewSelector

  # エラー画面の設定
  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end
  
  #include ErrorHandlers if Rails.env.production? or Rails.env.staging?  # 開発に影響が出ないように、本番と検証環境のみに適用する

  def twitter_client
    # Twitterから取得
    Twitter::REST::Client.new do |config|
      auth = session["DEVISE"]
      config.consumer_key = ENV["TWITTER_API_KEY"]
      config.consumer_secret = ENV["TWITTER_SECRET_KEY"]
      config.access_token = auth.credentials.token
      config.access_token_secret = auth.credentials.secret
    end
  end

end
