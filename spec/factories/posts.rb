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

FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "#{Faker::Lorem.sentence} #{n}" }
    published_at { Faker::Time.between(2.days.ago, 1.day.ago) }
    content { Faker::Lorem.paragraphs.join("\n\n") }
    category factory: :category
    author "Cristina Camacho"

    trait :published_in_future do
      published_at { 1.hour.from_now }
    end

    trait :unpublished do
      published_at nil
    end
  end
end
