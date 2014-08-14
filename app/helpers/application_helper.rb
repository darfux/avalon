module ApplicationHelper
  include I18nExtension
  def label_tag_t(name = nil, content_or_options = nil, options = nil, &block)
    label_tag(t(".#{name.to_s}"), content_or_options, options, &block)
  end

  def simple_format_wsp(text, html_options = {}, options = {})
    res = ""
    text = h(text)
    text.each_line do |line|
      m = line.match(/(^ +)([^ ]*)/)
      l = m ? m[1].length : 0
      line = "&nbsp;"*l + line[l..-1]
      res<<line
    end
    simple_format(res, html_options, options)
  end
end
