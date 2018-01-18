# frozen_string_literal: true

module Faker
  class UploadedImage
    def self.file(path = "file.png")
      Rack::Test::UploadedFile.new(
        ::File.join(Rails.root, "spec", "support", "images", path),
      )
    end
  end
end
