# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	inputs = {
		title: title_field = $('.post-title-field')
		body: body_field = $('.post-body-field')
	}
	unless errors.nil?
		for k,v of errors
			inputs[k].tooltip {
				title: "#{inputs[k].attr('placeholder')} #{v}"
			}