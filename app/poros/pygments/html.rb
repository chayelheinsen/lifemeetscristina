# frozen_string_literal: true

class Pygments::HTML < Redcarpet::Render::HTML
  def block_code(code, language)
    Pygments.highlight(code, lexer: language)
  end
end
