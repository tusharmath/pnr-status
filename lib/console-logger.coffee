'use strict'
moment = require 'moment'
print = console.log
clearl =  ->
	process.stdout.clearLine()
	process.stdout.cursorTo 0

printl = (str) ->
	process.stdout.write str.toString()

exports.log  =  _log = (pnrstatus) ->
	#print pnrstatus
	if pnrstatus.data.chart_prepared is true
		clearl()
		print '*** Chart prepared ***'
		
		print ''
		d = pnrstatus.data
		print "Pnr: #{d.pnr_number}"
		print "Travel: #{d.from.name} to #{d.to.name}"	
		print "Boarding: #{d.board.name}"
		print "Departure time: #{d.travel_date.date} #{d.board.time}"
		print "Train: #{d.train_name} (No. #{d.train_number})"
		print 'Seats - '
		for passenger in pnrstatus.data.passenger
			print "\t#{passenger.status}"
		
	
	else
		clearl()
		ctime = moment().format('DD-MMM-YYYY h:mm:ss a')
		printl "Chart not prepared, last checked on #{ctime}"
