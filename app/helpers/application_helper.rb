module ApplicationHelper
  include I18nExtension
  def label_tag_t(name = nil, content_or_options = nil, options = nil, &block)
    label_tag(t(".#{name.to_s}"), content_or_options, options, &block)
  end
end
