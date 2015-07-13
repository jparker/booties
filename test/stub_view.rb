class StubView
  def button_tag(content, options = nil, &block)
    content_tag :button, content, options, &block
  end

  def capture(*args, &block)
    block.call *args
  end

  def content_tag(tag, content, options = nil, &block)
    options, content = content, capture(&block) if options.nil?
    "<#{tag} #{attributes options}>#{content}</#{tag}>"
  end

  def raw(content)
    content
  end

  def translate(*args)
    I18n.translate *args
  end
  alias t translate

  private

  def attributes(prefix = nil, **attrs)
    prefix = "#{prefix}-" if prefix
    attrs.map { |key, value|
      if Hash === value
        attributes key, value
      else
        "#{prefix}#{key}=\"#{Array(value).compact.join(' ')}\""
      end
    }.join ' '
  end
end
