#Initialization
Minimist = require 'minimist'
Pnr = require './pnr-status'
Logger = require './console-logger'

#Initializations
argv = Minimist process.argv.slice 2
pnrNumber = Number argv._[0]

#Algorithm
onStatusRecieved = (status)->
	if not status.data.chart_prepared
		Logger.print new Error 'PNR number was invalid or null.'
		pnrStatus.stop() 
	else
		pnrStatus.stop() if status.data.chart_prepared is true
		Logger.log status

pnrStatus = new Pnr pnrNumber, onStatusRecieved
pnrStatus.start()

