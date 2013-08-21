# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.
#
# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
#
# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# compiled file.
#
# Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
# about supported directives.
#
#= require jquery
#= require jquery_ujs
#= require turbolinks
#= require_tree .
#= require bootstrap

affix_sidepane = () ->
	if $(window).width() >= 768
		console.log 'Affixing sidebar'
		$('#nav').affix {
			offset: {
				top: 0
				bottom: 0
			}
		}
	else
		$(window).off('.affix')
		$('#nav').removeData('affix').removeClass('affix affix-top affix-bottom')

$(document).ready ->
	affix_sidepane()
	$(window).resize ->
		affix_sidepane()