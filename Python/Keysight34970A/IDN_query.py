import pyvisa
rm = pyvisa.ResourceManager()
print(rm.list_resources())
my_instrument = rm.open_resource('GPIB0::9::INSTR')
print(my_instrument.query('*IDN?'))
# print(my_instrument.query('ROUT:CHAN:DEL? (@101:106)'))
