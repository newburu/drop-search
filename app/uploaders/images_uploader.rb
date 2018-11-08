class ImagesUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  #storage :file
  # storage :fog
  # アップロード先のストレージにSFTPを選択します。
  storage :sftp

  # SFTPの設定を記述
  configure do |config|
    # SFTPホスト名を指定します。
    config.sftp_host = "#{ENV['SFTP_HOST']}"
  
    # SFTPアカウントユーザー名を指定します。
    config.sftp_user = "#{ENV['SFTP_USERID']}"
  
    # SFTPアカウントパスワードとポート番号(22固定)を指定します。
    config.sftp_options = {
     :password => "#{ENV['SFTP_PASSWORD']}",
     :port => ENV['SFTP_PORT']
    }
  
    # SFTPホストにおける画像格納先を指定します。
    config.sftp_folder = "#{ENV['SFTP_DIR']}"
  
    # 上記、画像格納先を示すURLを指定します。
    config.sftp_url = "#{ENV['SFTP_DIR_URL']}"
  end

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fit: [50, 50]
  end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
  def filename
    "#{model.name}.#{file.extension}" if original_filename.present?
  end
end
