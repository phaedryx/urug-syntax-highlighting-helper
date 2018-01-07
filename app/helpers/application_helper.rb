module ApplicationHelper
  def code(title: nil, &block)
    capture(&block)
  end
end
