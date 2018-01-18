# frozen_string_literal: true

# == Schema Information
#
# Table name: posts
#
#  id           :integer          not null, primary key
#  title        :string
#  content      :text
#  image        :string
#  author       :string
#  category_id  :integer
#  published_at :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Post < ApplicationRecord
  is_impressionable counter_cache: true, unique: true

  belongs_to :category

  validates :title, presence: true
  validates :author, presence: true
  validates :content, presence: true

  scope :featured,    -> { order(impressions_count: :desc).limit(10) }
  scope :sorted,      -> { order(published_at: :desc) }
  scope :published,   -> { where("published_at < ?", Time.zone.now) }
  scope :unpublished, -> { where("published_at > ?", Time.zone.now).or(where(published_at: nil)) }

  mount_uploader :image, ImageUploader

  def published?
    published_at? && published_at < Time.zone.now
  end

  def published_at_string
    published_at.strftime("%B %d, %Y")
  end
end
