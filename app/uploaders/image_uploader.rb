# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  process :strip
  process interlace: "plane"
  process quality: "90"

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_white_list
    %w[jpeg jpg gif png svg]
  end

  def filename
    "#{Digest::SHA1.hexdigest(file.read)}.#{file.extension}" if original_filename
  end

  def strip
    manipulate! do |img|
      img.strip
      img = yield(img) if block_given?
      img
    end
  end

  def interlace(type)
    manipulate! do |img|
      img.interlace(type.to_s)
      img = yield(img) if block_given?
      img
    end
  end

  def quality(percentage)
    manipulate! do |img|
      img.quality(percentage.to_s)
      img = yield(img) if block_given?
      img
    end
  end

  def format(format)
    manipulate! do |img|
      img.format(format)
      img = yield(img) if block_given?
      img
    end
  end
end
