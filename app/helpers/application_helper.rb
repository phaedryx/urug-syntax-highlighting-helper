require 'rouge'

module ApplicationHelper
  LEXERS = {
    'javascript' => Rouge::Lexers::Javascript.new,
    'markdown' => Rouge::Lexers::Markdown.new,
    'ruby' => Rouge::Lexers::Ruby.new,
  }

  def code(title: nil, language: nil, &block)
    formatter = Rouge::Formatters::HTMLTable.new(
      Rouge::Formatters::HTML.new,
      table_class: 'code',
      gutter_class: 'gutter',
      code_class: 'source'
    )
    lexer = LEXERS[language] || LEXERS['markdown']
    source = formatter.format(lexer.lex(capture(&block))).html_safe

    tag.figure(
      tag.figcaption(title, class: 'title') +
      source,
      class: 'code-example'
    )
  end
end
