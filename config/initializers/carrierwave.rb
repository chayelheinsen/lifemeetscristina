# frozen_string_literal: true

CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  else
    config.fog_provider = "fog/aws"
    config.fog_credentials = {
      provider:              "AWS",
      aws_access_key_id:     ENV["AWS_ACCESS_KEY_ID"],
      aws_secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
    }

    config.storage = :fog

    asset_host = ENV["UPLOADED_ASSET_HOST"]
    asset_host_protocol = ENV["UPLOADED_ASSET_HOST_PROTOCOL"] || "https://"
    asset_host ||= Rails.application.config.action_controller.asset_host
    config.asset_host = asset_host ? "#{asset_host_protocol}#{asset_host}" : nil

    config.fog_directory  = ENV["S3_BUCKET_NAME"]
    config.fog_attributes = { "Cache-Control" => "max-age=#{365.days.to_i}" }

    config.cache_dir = "#{Rails.root}/tmp/uploads"
  end
end
