module ApplicationHelper
  def tf(*args)
    t(*args, scope: 'functional')
  end
  def label_tag_t(name = nil, content_or_options = nil, options = nil, &block)
    label_tag(t(".#{name.to_s}"), content_or_options, options, &block)
  end
  def current_user
    @current_user ||= session[:user_id] && User.find(session[:user_id])
  end
end
