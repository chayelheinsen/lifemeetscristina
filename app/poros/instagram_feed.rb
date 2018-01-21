# frozen_string_literal: true

class InstagramFeed
  include Enumerable

  CACHE_EXPIRATION = 12.hours
  DEFAULT_USERNAME = "lifemeetscc"

  def initialize(username = DEFAULT_USERNAME)
    @username = username
  end

  def media
    if items = response.dig("user", "media", "nodes")
      Rails.cache.fetch("instagram_feed", expires_in: CACHE_EXPIRATION) do
        items.map { |data| MediaItem.new(data) }
      end
    else
      []
    end
  end

  private

  def response
    HTTParty.get(endpoint)
  end

  def endpoint
    "https://instagram.com/#{@username}?__a=1"
  end

  class MediaItem
    def initialize(data)
      @data = data
    end

    def thumbnail
      @data["thumbnail_resources"].last
    end

    def url
      thumbnail["src"]
    end

    def cache_key
      @data["id"]
    end

    def caption
      @data["caption"]
    end

    def link
      "https://instagram.com/p/#{@data['code']}"
    end

    def width
      thumbnail["config_width"]
    end

    def height
      thumbnail["config_height"]
    end
  end
end
