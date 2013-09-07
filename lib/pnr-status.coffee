"use strict"
http = require 'http'
print = console.log

class PnrStatus 
	constructor: (@pnr=8216477093, @callback, @interval=30*60*1000) ->
		@url = "http://pnrapi.alagu.net/api/v1.0/pnr/#{@pnr}"
		@stop = false
	
	start: -> 
		me = @	
		http.get me.url,
		(response) -> response.on 'data', 
			(buffer) ->
				(->
					if @stop is false
						@timer = setTimeout (-> me.start()), @interval 
					@callback JSON.parse buffer.toString()					
				).call me
				
	stop: ->
		@stop = true
		clearTimeout @timer

module.exports = PnrStatus
