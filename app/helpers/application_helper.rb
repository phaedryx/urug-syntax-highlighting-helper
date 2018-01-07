require 'rouge'

module ApplicationHelper
  def code(title: nil, &block)
    source    = capture(&block)
    formatter = Rouge::Formatters::HTMLTable.new(Rouge::Formatters::HTML.new)
    lexer     = Rouge::Lexers::Ruby.new
    source    = formatter.format(lexer.lex(source))

    tag.figure(
      tag.figcaption(title, class: 'title') +
      source,
      class: 'code-example'
    )
  end
end
