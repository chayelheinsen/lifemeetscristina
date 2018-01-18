# frozen_string_literal: true

# == Schema Information
#
# Table name: images
#
#  id         :integer          not null, primary key
#  image      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Image, type: :model do
  describe "Validations" do
    it "requires an image" do
      blog_image = build_and_validate(:image, image: "")
      expect(blog_image.errors).to have_key(:image)
    end
  end
end
