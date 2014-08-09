root = exports ? this


initControllerDomain = ->
	domain = $('body').attr('cont')
	$(document).find('*').each ->
		self = $(this)
		if self.parents('nocont').length>0
			return true
		if self.attr('class') && (!self.attr('cont') || self.attr('cont')!='f')
			self.addClass(domain)
		if (id = self.attr('id')) && (!self.attr('cont') || self.attr('cont')!='f')
			self.attr('id', "#{domain}-#{id}")

ready = ->
	initControllerDomain()


$(document).ready(ready)
$(document).on('page:load', ready)