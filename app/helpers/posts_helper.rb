# frozen_string_literal: true

require_relative "../poros/pygments/html"
require "redcarpet/render_strip"

module PostsHelper
  def markdown_content(post)
    Rails.cache.fetch("#{post.cache_key}/markdown_content") do
      html = Pygments::HTML.new(
        no_styles: true,
      )

      renderer = Redcarpet::Markdown.new(html, fenced_code_blocks: true)
      renderer.render(post.content).html_safe
    end.html_safe
  end

  def truncated_description(post)
    Rails.cache.fetch("#{post.cache_key}/truncated_description") do
      plain = Redcarpet::Render::StripDown.new

      renderer = Redcarpet::Markdown.new(plain)
      content = renderer.render(Nokogiri::HTML(post.content).text)
      truncate(content, length: 160).html_safe
    end
  end

  def post_link(post, opts)
    link_to(
      post_path(post),
      opts,
    ) { yield }
  end
end
