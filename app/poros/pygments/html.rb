# frozen_string_literal: true

module Pygments
  class HTML < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end
end
