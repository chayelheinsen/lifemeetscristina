# frozen_string_literal: true

module ApplicationHelper
  def current_class?(test_path)
    return "active" if request.path == test_path
    ""
  end

  def meta_tag(tag, text)
    content_for :"meta_#{tag}", text
  end

  def yield_meta_tag(tag, default_text='')
    content_for?(:"meta_#{tag}") ? content_for(:"meta_#{tag}") : default_text
  end
end
