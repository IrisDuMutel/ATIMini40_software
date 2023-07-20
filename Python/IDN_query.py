import visa
keithley = visa.instrument("GPIB::12")
print (keithley.ask("*IDN?"))