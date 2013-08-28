# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
	inputs = {
		title: $('.post-title-field')
		body: $('.post-body-field')
	}
	if errors?
		for k,v of errors
			inputs[k].tooltip {
				title: "#{inputs[k].attr('placeholder')} #{v}"
			}