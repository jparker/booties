# frozen_string_literal: true

class StubView
  def button_tag(content, options = nil, &block)
    content_tag :button, content, options, &block
  end

  def capture(*args)
    yield(*args)
  end

  def content_tag(tag, content_or_opts, opts = nil, &block)
    if block_given?
      content = capture(&block)
      opts = content_or_opts
    else
      content = content_or_opts
    end
    "<#{[tag, *attributes(opts)].join(' ')}>#{content}</#{tag}>"
  end

  def raw(content)
    content
  end

  def translate(*args)
    I18n.translate(*args)
  end
  alias t translate

  private

  def attributes(prefix = nil, **attrs)
    prefix = "#{prefix}-" if prefix
    attrs.reject { |_, value| value.nil? }.flat_map do |key, value|
      if value.is_a?(Hash)
        attributes key, value
      else
        %(#{prefix}#{key}="#{Array(value).compact.join(' ')}")
      end
    end
  end
end
