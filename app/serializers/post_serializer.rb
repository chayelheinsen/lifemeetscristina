# frozen_string_literal: true

class PostSerializer < ActiveModel::Serializer
  attributes(
    :id, :title, :content, :image, :author, :url,
    :published_at, :published?, :published_at_string, :truncated_description
  )
  belongs_to :category
end
