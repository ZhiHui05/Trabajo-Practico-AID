import re
p='Trabajo_Elevator_LZH_MMC.Device.Application.1384b0c7-1793-4c76-969a-61c51b05e1b7.compileinfo'
b=open(p,'rb').read()
strs=[s.decode('ascii','ignore') for s in re.findall(rb'[\x20-\x7e]{3,}', b)]
keys=['PLC_PRG','GVL','Floor','Piso','Sensor','Motor','Boton','Puerta','At1','At0','Luz','Display','Conveyor','Elevator','Emergencia']
for k in keys:
    hits=[s for s in strs if k.lower() in s.lower()]
    print('==',k,len(hits))
    for s in hits[:12]:
        print('   ',s[:140])
