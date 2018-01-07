require 'rouge'

module ApplicationHelper
  def code(title: nil, &block)
    source    = capture(&block)
    formatter = Rouge::Formatters::HTMLTable.new(
      Rouge::Formatters::HTML.new,
      table_class: 'code',
      gutter_class: 'gutter',
      code_class: 'source'
    )
    lexer     = Rouge::Lexers::Ruby.new
    source    = formatter.format(lexer.lex(source)).html_safe

    tag.figure(
      tag.figcaption(title, class: 'title') +
      source,
      class: 'code-example'
    )
  end
end
