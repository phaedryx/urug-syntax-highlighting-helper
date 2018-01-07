module ApplicationHelper
  def code(title: nil, &block)
    source = capture(&block)

    tag.figure(
      tag.figcaption(title, class: 'title') +
      source,
      class: 'code-example'
    )
  end
end
