import re, xml.etree.ElementTree as ET, difflib
src='Elevator (Advanced)_LZH_MMC.factoryio'
dst='Elevator (Advanced)_LZH_MMC_IO_COMPLETO.factoryio'
t=open(src,encoding='utf-8-sig',newline='').read()

def keys_of(kind):
    d={}
    for m in re.finditer(r'<'+kind+r'\b([^>]*)>', t):
        a=m.group(1)
        nm=re.search(r'Name="([^"]*)"',a); ky=re.search(r'Key="([^"]*)"',a)
        if nm and ky:
            d.setdefault(nm.group(1),[]).append(ky.group(1))
    return d

bi=keys_of('BinaryInput'); bo=keys_of('BinaryOutput')
sensors=['Manual','Pusher(Front Limit)','Pusher (Back Limit)','Vision Sensor 1','Vision Sensor 2','Vision Sensor 3','Sensor_Pusher']
actuators=['Emitter 0','Emitter 1','Emitter 2','Emitter 3','Pusher','Cinta_Salida_GOOD','Cinta_Salida_Defetuoso','Remover_GOOD','Remover_Defectuosos']
for n in sensors:
    print('SENSOR',n,'->',bi.get(n))
for n in actuators:
    print('ACT',n,'->',bo.get(n))

s=t.index('<ModbusTCPClient>'); e=t.index('</ModbusTCPClient>')+len('</ModbusTCPClient>')
blk=t[s:e]
# safety: none already present
for n in sensors+actuators:
    k=(bi.get(n) or bo.get(n))[0]
    if k in blk: raise SystemExit('YA MAPEADO: '+n)

old_count='      <PointIOCount BitInputCount="20" BitOutputCount="26" FloatInputCount="0" FloatOutputCount="0" IntInputCount="0" IntOutputCount="0" NumericInputCount="0" NumericOutputCount="1" />'
new_count='      <PointIOCount BitInputCount="27" BitOutputCount="35" FloatInputCount="0" FloatOutputCount="0" IntInputCount="0" IntOutputCount="0" NumericInputCount="0" NumericOutputCount="1" />'
assert blk.count(old_count)==1
blk=blk.replace(old_count,new_count,1)

crlf='\r\n'
# inputs: find BitInput19 line
m=re.search(r'      <BitInput19 [^\r\n]*\r\n', blk)
assert m
lines=''
for i,n in enumerate(sensors, start=20):
    lines+='      <BitInput%d PointIOKey="%s" />%s' % (i, bi[n][0], crlf)
    if i!=26: pass
blk=blk[:m.end()]+lines+blk[m.end():]
# outputs: after BitOutput25
m=re.search(r'      <BitOutput25 [^\r\n]*\r\n', blk)
assert m
lines=''
for i,n in enumerate(actuators, start=26):
    lines+='      <BitOutput%d PointIOKey="%s" />%s' % (i, bo[n][0], crlf)
blk=blk[:m.end()]+lines+blk[m.end():]

new=t[:s]+blk+t[e:]
ET.fromstring(new)  # validate
open(dst,'w',encoding='utf-8-sig',newline='').write(new)
print('written',dst)

# diff summary
d=list(difflib.unified_diff(t.splitlines(True), new.splitlines(True), n=1))
for l in d:
    if l.startswith(('+','-')) and not l.startswith(('+++','---')):
        print(l.rstrip('\r\n'))
