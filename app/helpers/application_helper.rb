module ApplicationHelper
  def code(title: nil, &block)
    source = capture(&block)

    tag.figure(
      tag.figcaption(title) +
      source
    )
  end
end
