import pyvisa

### QUERY SECTION
rm = pyvisa.ResourceManager()
print(rm.list_resources())
my_instrument = rm.open_resource('GPIB0::9::INSTR')
print(my_instrument.query('*IDN?'))
# print(my_instrument.query('ROUT:CHAN:DEL? (@101:106)'))

### CONFIGURATION SECTION
my_instrument.write("*rst; status:preset; *cls")
my_instrument.baud_rate = 57600
my_instrument.write("DISP OFF")
my_instrument.write('ROUT:CHAN:DEL:AUTO OFF, (@101:106)')
my_instrument.write('ROUT:CHAN:DEL 0,(@101:106)')  # Set delay to 0.001 seconds


### MEASURE SECTION
while(1):
    my_instrument.write('SYST:TIME?')
    print(my_instrument.read())
    my_instrument.write('Measure:Voltage:DC? 5V, 0.0001, (@101)')
    print(my_instrument.read())
    # my_instrument.write('Measure:Voltage:DC? 10V, 0.00003, (@101)')
    # print(my_instrument.read())
    # my_instrument.write('Measure:Voltage:DC? 10V, 0.00003, (@103)')
    # print(my_instrument.read())
    # my_instrument.write('Measure:Voltage:DC? 10V, 0.00003, (@102)')
    # print(my_instrument.read())
    # my_instrument.write('Measure:Voltage:DC? 10V, 0.00003, (@104)')
    # print(my_instrument.read())
    # my_instrument.write('Measure:Voltage:DC? 10V, 0.00003, (@105)')
    # print(my_instrument.read())
    # my_instrument.write('Measure:Voltage:DC? 10V, 0.00003, (@106)')
    # print(my_instrument.read())


my_instrument = rm.close()