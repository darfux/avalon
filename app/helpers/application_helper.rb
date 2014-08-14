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

  def truncate_wch(text, options = {}, &block)
    return unless text
    length = options.fetch(:length, 30)
    index = l =0
    text.each_char do |ch|
      if ch.ascii_only?
        l+=0.9
      else
        l+=2
      end
      index+=1
      break if l>=length
    end
    truncate(text, length: index)
  end
end
