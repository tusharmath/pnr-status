#Initialization
Minimist = require 'minimist'
Pnr = require './pnr-status'
Logger = require './console-logger'

#Initializations
argv = Minimist process.argv.slice 2
pnrNumber = Number argv._[0]

#Algorithms
onStatusRecieved = (status)->
	pnrStatus.stop() if status.data.char_prepared is true
	Logger.log status

pnrStatus = new Pnr pnrNumber, onStatusRecieved, 10
pnrStatus.start()

