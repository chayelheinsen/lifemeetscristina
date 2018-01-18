# frozen_string_literal: true

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require "rails_helper"

RSpec.describe Category, type: :model do
  describe "Validations" do
    it "requires a name" do
      category = build_and_validate(:category, name: "")
      expect(category.errors).to have_key(:name)
    end
  end
end
