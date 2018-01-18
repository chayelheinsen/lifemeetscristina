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

require "rails_helper"

RSpec.describe Post, type: :model do
  describe "Validations" do
    it "has a valid factory" do
      expect(build_and_validate(:post)).to be_valid
    end

    it "requires a title" do
      post = build_and_validate(:post, title: "")
      expect(post.errors).to have_key(:title)
    end

    it "requires an author" do
      post = build_and_validate(:post, author: nil)
      expect(post.errors).to have_key(:author)
    end

    it "requires content" do
      post = build_and_validate(:post, content: "")
      expect(post.errors).to have_key(:content)
    end
  end

  describe ".published" do
    it "only returns posts that were published in the past" do
      _future = create(:post, published_at: 1.hour.from_now)
      past = create(:post, published_at: 1.hour.ago)
      _none = create(:post, published_at: nil)

      expect(Post.published).to match_array [past]
    end
  end

  describe ".unpublished" do
    it "only returns blog posts that were published in the past" do
      future = create(:post, published_at: 1.hour.from_now)
      _past = create(:post, published_at: 1.hour.ago)
      none = create(:post, published_at: nil)

      expect(Post.unpublished).to match_array [future, none]
    end
  end

  describe "#published?" do
    it "returns false if `published_at` is in the future" do
      expect(build_stubbed(:post, published_at: 1.hour.from_now).published?).to be false
    end

    it "returns false if `published_at` is nil" do
      expect(build_stubbed(:post, published_at: nil).published?).to be false
    end

    it "returns true if `published_at` is in the past" do
      expect(build_stubbed(:post, published_at: 1.hour.ago).published?).to be true
    end
  end
end
