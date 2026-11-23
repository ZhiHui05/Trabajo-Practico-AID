import re
p='Trabajo_Elevator_LZH_MMC.Device.Application.1384b0c7-1793-4c76-969a-61c51b05e1b7.compileinfo'
b=open(p,'rb').read()
strs=re.findall(rb'[\x20-\x7e]{4,}', b)
strs=[s.decode('ascii','ignore') for s in strs]
print('total strings',len(strs))
for i,s in enumerate(strs):
    if 'GVL' in s or 'At1' in s or 'Display' in s:
        print(i, s[:160])
