import re
p='Trabajo_Elevator_LZH_MMC.Device.Application.1384b0c7-1793-4c76-969a-61c51b05e1b7.compileinfo'
b=open(p,'rb').read()
for m in re.finditer(rb'PROGRAM PLC_PRG', b):
    print('---- offset', m.start())
    seg=b[max(0,m.start()-600):m.start()+1200]
    for s in re.findall(rb'[\x20-\x7e]{4,}', seg):
        print('   ', s.decode('ascii','ignore')[:200])
    print()
